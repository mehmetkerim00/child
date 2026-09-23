/// Нарезка SMS на сегменты по границам слов.
///
/// Оператор считает не сообщения, а сегменты, и режет длинный текст сам —
/// ровно по счётчику символов. Родитель тогда получает «Мерет переда» и
/// вторым сообщением «н, 07:42»: в лучшем случае непонятно, в худшем —
/// страшно. Поэтому режем мы и по словам.
///
/// Латиница помещается в алфавит GSM-7: 160 символов в одиночном
/// сообщении, 153 в каждом сегменте составного. Кириллица и туркменские
/// буквы (ç, ň, ş, ý, ž) в него не входят — весь текст уходит в UCS-2,
/// где на сегмент остаётся 70 и 67 символов соответственно.
abstract final class SmsText {
  static const gsmSingle = 160;
  static const gsmConcatenated = 153;
  static const unicodeSingle = 70;
  static const unicodeConcatenated = 67;

  /// Базовый алфавит GSM 03.38. Всё, чего здесь нет, переводит
  /// сообщение целиком в UCS-2 — одна буква «ç» удорожает его вдвое.
  static const _gsmAlphabet =
      '@£\$¥èéùìòÇ\nØø\rÅåΔ_ΦΓΛΩΠΨΣΘΞÆæßÉ !"#¤%&\'()*+,-./'
      '0123456789:;<=>?'
      '¡ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÑÜ§'
      '¿abcdefghijklmnopqrstuvwxyzäöñüà';

  /// Символы, которые в GSM-7 занимают две позиции.
  static const _gsmExtended = '^{}\\[~]|€';

  /// Нужна ли UCS-2, то есть 70 символов вместо 160.
  static bool isUnicode(String text) {
    for (final rune in text.runes) {
      final char = String.fromCharCode(rune);
      if (!_gsmAlphabet.contains(char) && !_gsmExtended.contains(char)) {
        return true;
      }
    }
    return false;
  }

  /// Сколько позиций занимает текст в своей кодировке.
  static int length(String text) {
    if (isUnicode(text)) return text.runes.length;
    var total = 0;
    for (final rune in text.runes) {
      total += _gsmExtended.contains(String.fromCharCode(rune)) ? 2 : 1;
    }
    return total;
  }

  /// Сколько сегментов займёт текст — по ним оператор берёт деньги.
  static int segments(String text) => split(text).length;

  /// Режет текст на сегменты по границам слов.
  ///
  /// Если слово само длиннее сегмента (длинная ссылка, например), его
  /// приходится резать жёстко — иначе сообщение не уйдёт вовсе.
  static List<String> split(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return const [];

    final unicode = isUnicode(trimmed);
    final single = unicode ? unicodeSingle : gsmSingle;
    if (length(trimmed) <= single) return [trimmed];

    final limit = unicode ? unicodeConcatenated : gsmConcatenated;
    final parts = <String>[];
    final current = StringBuffer();

    void flush() {
      final part = current.toString().trim();
      if (part.isNotEmpty) parts.add(part);
      current.clear();
    }

    for (final word in trimmed.split(RegExp(r'\s+'))) {
      // Слово длиннее сегмента: режем его, другого выхода нет.
      if (length(word) > limit) {
        flush();
        var rest = word;
        while (length(rest) > limit) {
          final chars = rest.runes.toList();
          parts.add(String.fromCharCodes(chars.take(limit)));
          rest = String.fromCharCodes(chars.skip(limit));
        }
        if (rest.isNotEmpty) current.write(rest);
        continue;
      }

      final candidate = current.isEmpty ? word : '$current $word';
      if (length(candidate) > limit) {
        flush();
        current.write(word);
      } else {
        current
          ..clear()
          ..write(candidate);
      }
    }
    flush();

    return parts;
  }
}
