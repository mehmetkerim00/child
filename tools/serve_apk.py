#!/usr/bin/env python3
"""Раздача домашних APK по Wi-Fi: страница с двумя ссылками и QR-кодами.

Телефон не умеет брать файлы с ноутбука сам, а гонять их через облако
при здешнем интернете — это полчаса на каждую сборку. Поэтому ноутбук
на минуту становится раздающим: открыли адрес на телефоне, нажали,
поставили.

    ./tools/serve_apk.py            # порт 8000
    ./tools/serve_apk.py --port 9000

Останавливается по Ctrl+C. Сервер отдаёт ровно два файла и больше
ничего: это домашняя сеть, но лишнего в ней открывать незачем.
"""

import argparse
import html
import io
import os
import socket
import sys
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

try:
    import segno
except ImportError:
    segno = None

ROOT = Path(__file__).resolve().parent.parent

APKS = {
    "parent": {
        "title": "Родителям",
        "subtitle": "Sag-Aman",
        "path": ROOT / "apps/parent/build/app/outputs/flutter-apk"
                     / "app-hometest-release.apk",
    },
    "driver": {
        "title": "Водителю",
        "subtitle": "Sag-Aman Водитель",
        "path": ROOT / "apps/driver/build/app/outputs/flutter-apk"
                     / "app-hometest-release.apk",
    },
}


def local_ip() -> str:
    """Адрес ноутбука в домашней сети."""
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # Соединение никуда не идёт — нужен только выбранный интерфейс.
        sock.connect(("192.168.1.1", 1))
        return sock.getsockname()[0]
    except OSError:
        return "127.0.0.1"
    finally:
        sock.close()


def qr_svg(data: str) -> str:
    """QR-код как встроенный SVG. Без segno — пустая строка."""
    if segno is None:
        return ""
    # segno пишет SVG байтами, поэтому буфер двоичный.
    buf = io.BytesIO()
    segno.make(data, error="m").save(
        buf, kind="svg", scale=5, border=2, dark="#1B1F24", xmldecl=False,
        svgns=True, omitsize=True,
    )
    return buf.getvalue().decode("utf-8")


def page(base: str) -> bytes:
    cards = []
    for key, apk in APKS.items():
        path = apk["path"]
        exists = path.exists()
        size = f"{path.stat().st_size / 1048576:.0f} МБ" if exists else "нет файла"
        url = f"{base}/{key}.apk"

        if exists:
            action = (
                f'<a class="btn" href="/{key}.apk">Скачать · {size}</a>'
                f'<div class="qr">{qr_svg(url)}</div>'
                f'<div class="url">{html.escape(url)}</div>'
            )
        else:
            action = (
                '<div class="missing">APK не собран.<br>'
                'Запустите <code>./tools/hometest.sh</code></div>'
            )

        cards.append(
            f'<section class="card">'
            f'<h2>{html.escape(apk["title"])}</h2>'
            f'<p class="sub">{html.escape(apk["subtitle"])}</p>'
            f'{action}</section>'
        )

    qr_note = "" if segno else (
        '<p class="note">QR-кодов нет: не установлен segno '
        '(<code>pip3 install segno</code>). Адреса ниже можно набрать руками.</p>'
    )

    return f"""<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sag-Aman — домашний тест</title>
<style>
  body {{ font-family: system-ui, -apple-system, sans-serif; margin: 0;
         padding: 24px 16px; background: #F7F8FA; color: #1B1F24; }}
  h1 {{ font-size: 24px; margin: 0 0 4px; }}
  .lead {{ color: #5A6370; margin: 0 0 24px; font-size: 15px; }}
  .card {{ background: #fff; border-radius: 20px; padding: 24px;
          margin-bottom: 16px; text-align: center; }}
  h2 {{ font-size: 26px; margin: 0; }}
  .sub {{ color: #5A6370; margin: 4px 0 20px; font-size: 15px; }}
  .btn {{ display: block; background: #1E5AA8; color: #fff; padding: 20px;
         border-radius: 16px; font-size: 19px; font-weight: 600;
         text-decoration: none; }}
  .qr {{ margin: 20px auto 8px; width: 180px; }}
  .qr svg {{ width: 100%; height: auto; }}
  .url {{ color: #5A6370; font-size: 13px; word-break: break-all; }}
  .missing {{ color: #B3261E; font-size: 16px; line-height: 1.5; }}
  code {{ background: #EEF1F4; padding: 2px 6px; border-radius: 6px; }}
  .note {{ color: #5A6370; font-size: 14px; }}
  footer {{ color: #5A6370; font-size: 14px; margin-top: 24px;
           line-height: 1.6; }}
</style>
</head>
<body>
<h1>Sag-Aman — домашний тест</h1>
<p class="lead">Откройте эту страницу на телефоне и нажмите кнопку.
Android спросит разрешение на установку — разрешите.</p>
{''.join(cards)}
{qr_note}
<footer>
Это тестовые сборки: они ставятся рядом с обычным приложением и
обращаются к серверу на ноутбуке.<br>
Телефон должен быть в том же Wi-Fi.
</footer>
</body>
</html>
""".encode("utf-8")


class Handler(BaseHTTPRequestHandler):
    # Тихий лог: в консоли нужен адрес, а не поток запросов за иконками.
    def log_message(self, fmt, *args):
        if self.path.endswith(".apk"):
            sys.stdout.write(f"  качают {self.path} → {self.client_address[0]}\n")
            sys.stdout.flush()

    def do_GET(self):
        path = self.path.split("?")[0]

        if path in ("/", "/index.html"):
            body = page(f"http://{local_ip()}:{self.server.server_port}")
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)
            return

        for key, apk in APKS.items():
            if path == f"/{key}.apk":
                file = apk["path"]
                if not file.exists():
                    self.send_error(404, "APK not built")
                    return
                self.send_response(200)
                self.send_header(
                    "Content-Type", "application/vnd.android.package-archive")
                self.send_header("Content-Length", str(file.stat().st_size))
                self.send_header(
                    "Content-Disposition",
                    f'attachment; filename="sagaman-{key}.apk"')
                self.end_headers()
                with file.open("rb") as f:
                    while chunk := f.read(256 * 1024):
                        self.wfile.write(chunk)
                return

        self.send_error(404)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--port", type=int, default=8000)
    args = parser.parse_args()

    missing = [k for k, v in APKS.items() if not v["path"].exists()]
    if len(missing) == len(APKS):
        print("APK не собраны. Сначала: ./tools/hometest.sh", file=sys.stderr)
        return 1
    if missing:
        print(f"Внимание: не собран APK — {', '.join(missing)}\n")

    ip = local_ip()
    url = f"http://{ip}:{args.port}"

    print()
    print("  Откройте на телефоне:")
    print(f"      {url}")
    print()
    if segno:
        segno.make(url, error="m").terminal(compact=True)
        print()
    print("  Ctrl+C — остановить раздачу")
    print()

    server = ThreadingHTTPServer(("0.0.0.0", args.port), Handler)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nРаздача остановлена.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
