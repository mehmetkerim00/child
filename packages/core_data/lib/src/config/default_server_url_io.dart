import 'dart:io';

/// Эмулятор Android видит компьютер разработчика по адресу 10.0.2.2.
String defaultServerUrl() =>
    Platform.isAndroid ? 'http://10.0.2.2:8180/' : 'http://localhost:8180/';
