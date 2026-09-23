import 'package:child_server/src/generated/protocol.dart';
import 'package:child_server/src/services/notifications/notification_texts.dart';
import 'package:child_server/src/services/sms/sms_text.dart';
import 'package:test/test.dart';

/// Нарезка SMS.
///
/// Проверяем не «функция работает», а то, что родитель прочтёт целые
/// слова. Оператор режет по счётчику символов, и «Мерет передан» легко
/// превращается в «Мерет переда» + «н» — при плохих новостях это пугает
/// сильнее самой новости.
void main() {
  group('Кодировка', () {
    test('латиница помещается в GSM-7: 160 символов', () {
      expect(SmsText.isUnicode('Child: ride confirmed'), isFalse);
      expect(SmsText.split('a' * 160), hasLength(1));
      expect(SmsText.split('${'a ' * 80}b').length, greaterThan(1));
    });

    test('кириллица требует UCS-2: 70 символов', () {
      expect(SmsText.isUnicode('Мерет передан'), isTrue);
      expect(SmsText.split('я' * 70), hasLength(1));
      expect(SmsText.split('я' * 71).length, greaterThan(1));
    });

    test('туркменские буквы тоже уводят в UCS-2', () {
      // ç, ň, ş, ý, ž не входят в алфавит GSM-7 — а без них по-туркменски
      // не написать ни одной фразы сервиса.
      for (final letter in ['ç', 'ň', 'ş', 'ý', 'ž']) {
        expect(
          SmsText.isUnicode('Test $letter'),
          isTrue,
          reason: 'буква «$letter» удваивает цену сообщения',
        );
      }
      // А вот «ü» в GSM-7 есть: не всякая туркменская фраза дорогая.
      expect(SmsText.isUnicode('Sürüji geldi'), isFalse);
      expect(SmsText.isUnicode('Sürüji çykdy'), isTrue);
    });

    test('ä, ö, ü и ñ в GSM-7 есть — за них не переплачиваем', () {
      expect(SmsText.isUnicode('Sähra'), isFalse);
    });

    test('английские уведомления остаются в GSM-7', () {
      // Типографский апостроф (’) и тире (—) не входят в GSM-7 и
      // переводят сообщение в UCS-2: 70 символов вместо 160, то есть
      // двойная цена на ровном месте.
      for (final type in RideEventType.values) {
        final text = NotificationTexts.forParent(
          type: type,
          locale: 'en',
          childName: 'Merit',
          driverName: 'Aman',
          time: '07:42',
          note: 'traffic',
        );
        expect(
          SmsText.isUnicode(text),
          isFalse,
          reason: 'текст «$text» ушёл в UCS-2 — ищите «умную» кавычку или тире',
        );
      }
    });
  });

  group('Нарезка по словам', () {
    /// Длинный русский текст: именно такие и режет оператор.
    const long =
        'Как пополнить: передайте наличные водителю или диспетчеру. '
        'Водитель отметит приём в приложении, диспетчер подтвердит — '
        'деньги появятся на балансе.';

    test('ни один сегмент не начинается и не кончается обрывком слова', () {
      final parts = SmsText.split(long);

      expect(parts.length, greaterThan(1), reason: 'текст заведомо длинный');

      // Склеенные сегменты должны дать исходные слова без потерь.
      expect(
        parts.join(' ').split(RegExp(r'\s+')),
        long.split(RegExp(r'\s+')),
        reason: 'слово разорвано между сегментами',
      );
    });

    test('каждый сегмент помещается в 67 символов', () {
      for (final part in SmsText.split(long)) {
        expect(
          SmsText.length(part),
          lessThanOrEqualTo(SmsText.unicodeConcatenated),
          reason: 'сегмент «$part» длиннее, чем примет оператор',
        );
      }
    });

    test('короткое сообщение остаётся одним сегментом', () {
      expect(SmsText.split('Мерет в машине, 07:42'), hasLength(1));
      expect(SmsText.segments('Мерет в машине, 07:42'), 1);
    });

    test('пустой текст не порождает пустых сегментов', () {
      expect(SmsText.split(''), isEmpty);
      expect(SmsText.split('   '), isEmpty);
    });

    test('слово длиннее сегмента режется, но текст не теряется', () {
      final link = 'a' * 400;
      final parts = SmsText.split(link);

      expect(parts.join(), link, reason: 'потеряли часть ссылки');
      for (final part in parts) {
        expect(
          SmsText.length(part),
          lessThanOrEqualTo(SmsText.gsmConcatenated),
        );
      }
    });
  });

  group('Тексты уведомлений на трёх языках', () {
    test('каждое событие переведено и непусто', () {
      for (final locale in NotificationTexts.locales) {
        for (final type in RideEventType.values) {
          final text = NotificationTexts.forParent(
            type: type,
            locale: locale,
            childName: 'Мерет',
            driverName: 'Аман',
            time: '07:42',
            note: 'пробка',
          );
          expect(
            text,
            isNotEmpty,
            reason: 'событие $type на языке «$locale» без текста',
          );
        }
        expect(NotificationTexts.title(locale), isNotEmpty);
        expect(
          NotificationTexts.forDriver(
            locale: locale,
            childName: 'Мерет',
            time: '07:30',
          ),
          isNotEmpty,
        );
      }
    });

    test('обычное событие умещается в один сегмент на любом языке', () {
      // Родитель платит вниманием, а сервис — деньгами: рутинное
      // «забрал» не должно уходить двумя сообщениями.
      for (final locale in NotificationTexts.locales) {
        final text = NotificationTexts.forParent(
          type: RideEventType.pickedUp,
          locale: locale,
          childName: 'Мерет',
          driverName: 'Аман',
          time: '07:42',
        );
        expect(
          SmsText.segments(text),
          1,
          reason: 'на «$locale» текст «$text» занял больше одного сегмента',
        );
      }
    });

    test('незнакомый язык не даёт пустого текста', () {
      final text = NotificationTexts.forParent(
        type: RideEventType.handedOver,
        locale: 'de',
        childName: 'Мерет',
        driverName: 'Аман',
        time: '08:05',
      );
      expect(text, contains('Мерет'));
    });
  });
}
