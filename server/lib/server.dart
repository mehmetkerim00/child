import 'dart:io';

import 'package:serverpod/serverpod.dart';

import 'src/auth/auth_handler.dart';
import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/web/routes/root.dart';

/// Точка входа сервера.
void run(List<String> args) async {
  // Вход по телефону и SMS-коду: токен сессии проверяет authenticationHandler.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: authenticationHandler,
  );

  pod.webServer.addRoute(RootRoute(), '/');
  pod.webServer.addRoute(RootRoute(), '/index.html');
  pod.webServer.addRoute(
    StaticRoute.directory(Directory(Uri(path: 'web/static').toFilePath())),
  );

  // Веб-панель диспетчера (собирается `serverpod run flutter_build`).
  final appDir = Directory(Uri(path: 'web/app').toFilePath());
  if (appDir.existsSync()) {
    pod.webServer.addRoute(FlutterRoute(appDir), '/app');
  } else {
    pod.webServer.addRoute(
      StaticRoute.file(
        File(Uri(path: 'web/pages/build_flutter_app.html').toFilePath()),
      ),
      '/app/**',
    );
  }

  await pod.start();
}
