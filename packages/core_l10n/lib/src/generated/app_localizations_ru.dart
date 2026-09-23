// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitleParent => 'Child — родителям';

  @override
  String get appTitleDriver => 'Child — водитель';

  @override
  String get appTitleDispatcher => 'Child — диспетчер';

  @override
  String flavorBadge(String flavor) {
    return 'Среда: $flavor';
  }

  @override
  String get language => 'Язык';

  @override
  String get languageRu => 'Русский';

  @override
  String get languageTk => 'Türkmen';

  @override
  String stubNotice(String sprint) {
    return 'Экран-заглушка. Функциональность появится в спринте $sprint.';
  }

  @override
  String get serverStatusTitle => 'Связь с сервером';

  @override
  String get serverChecking => 'Проверяем…';

  @override
  String serverOk(String version) {
    return 'Сервер работает (версия $version)';
  }

  @override
  String get serverUnavailable => 'Сервер недоступен';

  @override
  String get retry => 'Повторить';

  @override
  String get parentTodayTitle => 'Сегодня';

  @override
  String get parentTodayEmpty => 'Поездок на сегодня нет';

  @override
  String get driverTodayTitle => 'Маршрут дня';

  @override
  String get driverActionDeparted => 'Выехал';

  @override
  String get driverStubAction =>
      'Кнопки этапов поездки заработают в спринте S3';

  @override
  String get dispatcherBoardTitle => 'Доска дня';

  @override
  String get dispatcherBoardEmpty => 'Нет поездок';

  @override
  String get rideStatusScheduled => 'Запланирована';

  @override
  String get rideStatusConfirmed => 'Подтверждена';

  @override
  String get rideStatusEnRoute => 'Водитель выехал';

  @override
  String get rideStatusPickedUp => 'Забрал ребёнка';

  @override
  String get rideStatusInTransit => 'В пути';

  @override
  String get rideStatusArrived => 'Приехали';

  @override
  String get rideStatusHandedOver => 'Передан';

  @override
  String get rideStatusDelayed => 'Задержка';

  @override
  String get rideStatusCancelledByFamily => 'Отменена семьёй';

  @override
  String get rideStatusCancelledNoDriver => 'Отменена: нет водителя';

  @override
  String get rideStatusDriverReplaced => 'Замена водителя';

  @override
  String get loginTitle => 'Вход';

  @override
  String get loginPhoneLabel => 'Номер телефона';

  @override
  String get loginPhoneHint => '65 12-34-56';

  @override
  String get loginRequestCode => 'Получить код';

  @override
  String get loginCodeLabel => 'Код из SMS';

  @override
  String get loginVerify => 'Войти';

  @override
  String get loginChangePhone => 'Изменить номер';

  @override
  String loginCodeSentTo(String phone) {
    return 'Код отправлен на $phone';
  }

  @override
  String get loginHint =>
      'Номер заводит диспетчер. Если войти не получается — позвоните ему.';

  @override
  String get loginDevSeed => 'Заполнить тестовыми данными';

  @override
  String get loginDevSeedDone =>
      'Готово. Диспетчер: 65 00-00-01, родитель: 65 20-00-01, водитель: 65 10-00-01';

  @override
  String get errorUnknownPhone =>
      'Этот номер не зарегистрирован. Обратитесь к диспетчеру.';

  @override
  String get errorWrongCode => 'Неверный код';

  @override
  String get errorCodeExpired => 'Код истёк, запросите новый';

  @override
  String get errorTooManyAttempts =>
      'Слишком много попыток, запросите новый код';

  @override
  String get errorCodeNotRequested => 'Сначала запросите код';

  @override
  String get errorNetwork => 'Нет связи с сервером';

  @override
  String get logout => 'Выйти';

  @override
  String greeting(String name) {
    return 'Здравствуйте, $name';
  }

  @override
  String get save => 'Сохранить';

  @override
  String get cancel => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get add => 'Добавить';

  @override
  String get edit => 'Изменить';

  @override
  String get emptyList => 'Пока пусто';

  @override
  String get dispatcherTabFamilies => 'Семьи';

  @override
  String get dispatcherTabChildren => 'Дети';

  @override
  String get dispatcherTabDrivers => 'Водители';

  @override
  String get dispatcherTabInstitutions => 'Учреждения';

  @override
  String get fieldName => 'Имя';

  @override
  String get fieldFamilyName => 'Название семьи';

  @override
  String get fieldPhone => 'Телефон';

  @override
  String get fieldAddress => 'Адрес';

  @override
  String get fieldCarModel => 'Машина';

  @override
  String get fieldCarPlate => 'Госномер';

  @override
  String get fieldCodeWord => 'Кодовое слово';

  @override
  String get fieldBirthYear => 'Год рождения';

  @override
  String get fieldHandoverCode => 'Код учреждения';

  @override
  String get fieldType => 'Тип';

  @override
  String get fieldFamily => 'Семья';

  @override
  String get fieldExperience => 'Стаж и опыт';

  @override
  String get fieldNeedsChildSeat => 'Нужно детское кресло';

  @override
  String get fieldIsFemaleDriver => 'Женщина-водитель';

  @override
  String get fieldSmsLevel => 'SMS-уведомления';

  @override
  String get smsLevelAll => 'Все события';

  @override
  String get smsLevelCritical => 'Только критические';

  @override
  String get institutionKindergarten => 'Детский сад';

  @override
  String get institutionSchool => 'Школа';

  @override
  String get institutionSection => 'Секция';

  @override
  String get institutionClub => 'Кружок';

  @override
  String get vettingPending => 'На проверке';

  @override
  String get vettingVerified => 'Проверен';

  @override
  String get vettingRejected => 'Отклонён';

  @override
  String get circlePrimary => 'Постоянный водитель';

  @override
  String get circleBackup1 => 'Резервный 1';

  @override
  String get circleBackup2 => 'Резервный 2';

  @override
  String get parentChildrenTitle => 'Мои дети';

  @override
  String get parentDriversTitle => 'Наш водитель';

  @override
  String get driverProfileTitle => 'Мой профиль';

  @override
  String get saved => 'Сохранено';

  @override
  String get requiredField => 'Заполните поле';

  @override
  String get dispatcherDirectories => 'Справочники';

  @override
  String get dispatcherCircleTitle => 'Круг семьи';

  @override
  String get notSet => 'Не задано';

  @override
  String get parentRoutesTitle => 'Маршруты';

  @override
  String get parentRequestRoute => 'Заявка на маршрут';

  @override
  String get routeStatusPending => 'На активации у диспетчера';

  @override
  String get routeStatusActive => 'Активен';

  @override
  String get routeWeekdays => 'Дни недели';

  @override
  String get routePickupTime => 'Время подачи';

  @override
  String get routeFrom => 'Откуда';

  @override
  String get routeTo => 'Куда';

  @override
  String get routeDirection => 'Направление';

  @override
  String get directionToInstitution => 'Из дома в учреждение';

  @override
  String get directionToHome => 'Из учреждения домой';

  @override
  String get routeChild => 'Ребёнок';

  @override
  String get routePrice => 'Цена поездки, манатов';

  @override
  String get routeRequestSent => 'Заявка отправлена диспетчеру';

  @override
  String get weekdayMon => 'Пн';

  @override
  String get weekdayTue => 'Вт';

  @override
  String get weekdayWed => 'Ср';

  @override
  String get weekdayThu => 'Чт';

  @override
  String get weekdayFri => 'Пт';

  @override
  String get weekdaySat => 'Сб';

  @override
  String get weekdaySun => 'Вс';

  @override
  String get dispatcherTabRoutes => 'Маршруты';

  @override
  String get dispatcherPendingRoutes => 'Заявки на активацию';

  @override
  String get dispatcherActivate => 'Активировать';

  @override
  String get dispatcherDeactivate => 'Отключить';

  @override
  String get dispatcherAssignDriver => 'Водитель';

  @override
  String get dispatcherGenerateRides => 'Создать поездки';

  @override
  String dispatcherRidesCreated(int count) {
    return 'Создано поездок: $count';
  }

  @override
  String get driverTomorrowTitle => 'Завтра';

  @override
  String get driverConfirmDeadline => 'Подтвердите до 20:00';

  @override
  String get driverConfirm => 'Подтверждаю';

  @override
  String get driverDecline => 'Не могу';

  @override
  String get driverDeclineReason => 'Причина';

  @override
  String get driverDeclineHint => 'Диспетчер получит причину и найдёт замену';

  @override
  String get driverConfirmed => 'Подтверждено';

  @override
  String get driverNoRidesTomorrow => 'На завтра поездок нет';

  @override
  String get ridesToday => 'Поездки сегодня';

  @override
  String rideAt(String time) {
    return 'в $time';
  }

  @override
  String get todayTab => 'Сегодня';

  @override
  String get tomorrowTab => 'Завтра';

  @override
  String get dispatcherProblems => 'Проблемы';

  @override
  String get rideFlowTitle => 'Поездка';

  @override
  String get actionDepart => 'Выехал';

  @override
  String get actionPickUp => 'Забрал';

  @override
  String get actionStartTransit => 'Посадил, едем';

  @override
  String get actionArrive => 'Приехали';

  @override
  String get actionHandOver => 'Передал';

  @override
  String get actionDelay => 'Задержка';

  @override
  String get codeWordPrompt =>
      'Назовите кодовое слово семьи и попросите подтвердить';

  @override
  String get codeWordField => 'Кодовое слово';

  @override
  String get handoverPrompt =>
      'Введите код учреждения или попросите расписаться';

  @override
  String get institutionCodeField => 'Код учреждения';

  @override
  String get signatureButton => 'Подпись принимающего';

  @override
  String get signatureDone => 'Подпись получена';

  @override
  String get signatureClear => 'Стереть';

  @override
  String get delayReasonField => 'Причина задержки';

  @override
  String pendingEvents(int count) {
    return '$count событий ждут отправки';
  }

  @override
  String get allEventsSent => 'Все события отправлены';

  @override
  String get retrySync => 'Отправить сейчас';

  @override
  String get rideFinished => 'Поездка завершена';

  @override
  String get errorWrongCodeWordServer => 'Кодовое слово не совпало';

  @override
  String get errorWrongOrder => 'Этот этап сейчас недоступен';

  @override
  String get errorHandoverProof => 'Нужен код учреждения или подпись';

  @override
  String get errorRideFinished => 'Поездка уже завершена';

  @override
  String get eventsTimeline => 'Что происходило';

  @override
  String get parentRideTitle => 'Поездка ребёнка';

  @override
  String get trackingOn => 'Родитель видит, где машина';

  @override
  String get trackingOff => 'Геолокация выключена';

  @override
  String get trackingDenied =>
      'Нет доступа к геолокации: родитель не увидит машину на карте';

  @override
  String get rideOnMap => 'Показать на карте';

  @override
  String get parentNotificationsTitle => 'Уведомления';

  @override
  String get notificationChannelPush => 'Push';

  @override
  String get notificationChannelSms => 'SMS';

  @override
  String get notificationQueued => 'В очереди';

  @override
  String get notificationSent => 'Отправлено';

  @override
  String get notificationAcked => 'Доставлено';

  @override
  String get notificationFailed => 'Не доставлено';

  @override
  String get dispatcherTasksTitle => 'Задачи';

  @override
  String get dispatcherNoTasks => 'Задач нет';

  @override
  String get taskResolve => 'Решено';

  @override
  String get taskRideNotConfirmed => 'Поездка не подтверждена';

  @override
  String get taskDriverNotDeparted => 'Водитель не выехал';

  @override
  String get taskNotificationUndelivered => 'Уведомление не дошло — позвонить';

  @override
  String get taskRideWithoutDriver => 'Поездка без водителя';

  @override
  String get smsConsoleTitle => 'Отправить SMS';

  @override
  String get smsConsoleSend => 'Отправить';

  @override
  String get smsConsoleBody => 'Текст сообщения';

  @override
  String get smsConsoleSent => 'SMS поставлена в очередь';

  @override
  String get parentBalanceTitle => 'Баланс';

  @override
  String get balanceCurrent => 'Остаток';

  @override
  String get balancePending => 'Ожидает подтверждения';

  @override
  String get balanceLowWarning =>
      'Денег меньше чем на три поездки — пора пополнить';

  @override
  String get balanceHowTo =>
      'Как пополнить: передайте наличные водителю или диспетчеру. Водитель отметит приём в приложении, диспетчер подтвердит — деньги появятся на балансе.';

  @override
  String balanceManat(String amount) {
    return '$amount манат';
  }

  @override
  String get ledgerCashTopup => 'Пополнение наличными';

  @override
  String get ledgerRideCharge => 'Поездка';

  @override
  String get ledgerAdjust => 'Корректировка';

  @override
  String get driverCashTitle => 'Наличные';

  @override
  String get driverCashAccept => 'Принять пополнение';

  @override
  String get driverCashFamily => 'Семья';

  @override
  String get driverCashAmount => 'Сумма, манатов';

  @override
  String get driverCashSignature => 'Подпись родителя';

  @override
  String get driverCashPending => 'Ждёт подтверждения диспетчера';

  @override
  String get driverCashConfirmed => 'Подтверждено';

  @override
  String get driverCashRejected => 'Отклонено';

  @override
  String get dispatcherTopUpsTitle => 'Пополнения';

  @override
  String get dispatcherConfirm => 'Подтвердить';

  @override
  String get dispatcherReject => 'Отклонить';

  @override
  String get dispatcherRejectReason => 'Причина отказа';

  @override
  String get moneyTab => 'Деньги';

  @override
  String get onboardingTitle1 => 'Постоянный водитель, а не случайный';

  @override
  String get onboardingText1 =>
      'Вашего ребёнка возит один и тот же человек, которого вы видели заранее. Если он не может выйти, диспетчер предложит запасного из вашего круга — тоже знакомого.';

  @override
  String get onboardingTitle2 => 'Передача из рук в руки';

  @override
  String get onboardingText2 =>
      'Водитель называет кодовое слово вашей семьи, когда забирает ребёнка, и подтверждает передачу кодом учреждения или подписью воспитателя. Ребёнок не подтверждает ничего — только взрослые.';

  @override
  String get onboardingTitle3 => 'Вы узнаете, даже если нет интернета';

  @override
  String get onboardingText3 =>
      'О главных событиях — «забрал», «передал», отмена — приходит SMS, даже когда push не доходит. Поездку видно на карте, пока машина едет.';

  @override
  String get onboardingNext => 'Дальше';

  @override
  String get onboardingStart => 'Начать';

  @override
  String get offlineBanner =>
      'Нет связи с сервером. Данные могут быть устаревшими.';

  @override
  String get poolTitle => 'Пул: дети в одной машине';

  @override
  String get poolCandidates => 'Можно объединить';

  @override
  String get poolMerge => 'Объединить в пул';

  @override
  String poolSeatsLeft(int seats, int childSeats) {
    return 'Свободных мест: $seats, кресел: $childSeats';
  }

  @override
  String poolChildrenInCar(int count) {
    return 'Детей в машине: $count';
  }

  @override
  String get poolNoCandidates => 'Подходящих поездок нет';

  @override
  String poolTimeDiff(int minutes) {
    return 'разница $minutes мин';
  }

  @override
  String get poolNeedsChildSeat => 'нужно кресло';

  @override
  String get seatPickUp => 'Забрать';

  @override
  String get seatHandOver => 'Передать';

  @override
  String get seatPickedUp => 'В машине';

  @override
  String get seatHandedOver => 'Передан';

  @override
  String get seatWaiting => 'Ждёт';

  @override
  String get seatWhichChild => 'Кого забираем';

  @override
  String get chatTitle => 'Сообщения';

  @override
  String get chatHint =>
      'Пишите водителю прямо здесь — номера телефонов не раскрываются';

  @override
  String get chatSend => 'Отправить';

  @override
  String get chatPlaceholder => 'Сообщение';

  @override
  String get chatEmpty => 'Сообщений пока нет';

  @override
  String get chatQuickPhrases => 'Быстрые фразы';

  @override
  String get phraseComingOut => 'Выходим';

  @override
  String get phraseDelayFive => 'Задерживаемся на 5 минут';

  @override
  String get phraseChildSick => 'Ребёнок болеет, отмените сегодня';

  @override
  String get phraseWaitingEntrance => 'Ждём у подъезда';

  @override
  String get phraseArrivedCallChild => 'Подъехал, позовите ребёнка';

  @override
  String get phraseAllGood => 'Всё хорошо';

  @override
  String get emergencyCall => 'Позвонить диспетчеру';

  @override
  String get emergencyHint =>
      'Срочный вопрос — звоните диспетчеру, он свяжется с водителем';

  @override
  String get institutionAccessTitle => 'Ссылка для учреждения';

  @override
  String get institutionAccessIssue => 'Выдать ссылку';

  @override
  String get institutionAccessIssuedTo => 'Кому выдаём (имя воспитателя)';

  @override
  String get institutionAccessCopy =>
      'Скопируйте и передайте — она показывается один раз';

  @override
  String get institutionAccessRevoke => 'Отозвать';

  @override
  String get institutionAccessRevoked => 'Отозвана';

  @override
  String get institutionAccessActive => 'Действует';

  @override
  String get absenceTitle => 'Сегодня не едем';

  @override
  String get absenceReason => 'Причина';

  @override
  String get absenceHint => 'Водитель и учреждение увидят это сразу';

  @override
  String get absenceDone => 'Отмечено: сегодня не едем';

  @override
  String get trainingTitle => 'Обучение';

  @override
  String get trainingIntro =>
      'Короткие уроки и тест по протоколу передачи ребёнка. Пока тест не сдан, маршруты не назначаются.';

  @override
  String get trainingStart => 'Пройти тест';

  @override
  String get trainingPassed => 'Тест сдан';

  @override
  String trainingFailed(int correct, int total) {
    return 'Тест не сдан: $correct из $total. Попробуйте ещё раз';
  }

  @override
  String trainingResult(int correct, int total) {
    return '$correct из $total';
  }

  @override
  String get trainingNext => 'Дальше';

  @override
  String get trainingFinish => 'Завершить тест';

  @override
  String trainingQuestion(int number, int total) {
    return 'Вопрос $number из $total';
  }

  @override
  String get hiringTitle => 'Кандидаты';

  @override
  String get hiringChecklist => 'Проверки';

  @override
  String get hiringHire => 'Нанять';

  @override
  String get hiringReject => 'Отказать';

  @override
  String get hiringRejectReason => 'Причина отказа';

  @override
  String get hiringStatusSubmitted => 'Анкета подана';

  @override
  String get hiringStatusDocuments => 'Документы';

  @override
  String get hiringStatusInterview => 'Собеседование';

  @override
  String get hiringStatusCarCheck => 'Осмотр машины';

  @override
  String get hiringStatusTraining => 'Обучение';

  @override
  String get hiringStatusHired => 'Принят';

  @override
  String get hiringStatusRejected => 'Отказ';

  @override
  String get checkPassport => 'Паспорт';

  @override
  String get checkLicense => 'Водительское удостоверение';

  @override
  String get checkCarDocs => 'Документы на машину';

  @override
  String get checkCriminal => 'Справка о несудимости';

  @override
  String get checkInterview => 'Собеседование';

  @override
  String get checkChildSeat => 'Показал установку кресла';

  @override
  String get checkReferences => 'Рекомендации';

  @override
  String get incidentsTitle => 'Инциденты';

  @override
  String get incidentLog => 'Зафиксировать';

  @override
  String get incidentResolution => 'Решение';

  @override
  String get incidentSeverityNote => 'Замечание';

  @override
  String get incidentSeveritySerious => 'Серьёзное';

  @override
  String get incidentSeverityCritical => 'Критическое';

  @override
  String get payoutsTitle => 'Расчёты';

  @override
  String payoutBlocks(int blocks) {
    return 'Блоков: $blocks';
  }

  @override
  String get payoutTotal => 'К выплате';

  @override
  String get payoutMarkPaid => 'Выплачено';

  @override
  String get trainingQ1 =>
      'Родитель не вышел, ребёнок стоит у подъезда один. Что делать?';

  @override
  String get trainingQ1a => 'Посадить и ехать, чтобы не опоздать';

  @override
  String get trainingQ1b => 'Позвонить диспетчеру и ждать взрослого';

  @override
  String get trainingQ1c => 'Отметить «Забрал» и позвонить позже';

  @override
  String get trainingQ2 => 'Кодовое слово семьи нужно, чтобы:';

  @override
  String get trainingQ2a => 'Отчитаться перед диспетчером';

  @override
  String get trainingQ2b =>
      'Родитель убедился, что приехал именно наш водитель';

  @override
  String get trainingQ2c => 'Открыть приложение';

  @override
  String get trainingQ3 => 'Кто отмечает этапы поездки в приложении?';

  @override
  String get trainingQ3a => 'Ребёнок';

  @override
  String get trainingQ3b => 'Водитель';

  @override
  String get trainingQ3c => 'Родитель';

  @override
  String get trainingQ4 =>
      'В школе нет кода учреждения. Как подтвердить передачу?';

  @override
  String get trainingQ4a => 'Пропустить подтверждение';

  @override
  String get trainingQ4b => 'Взять подпись принимающего на экране';

  @override
  String get trainingQ4c => 'Отметить «Передал» без ничего';

  @override
  String get trainingQ5 => 'Пропал интернет посреди поездки. Что делать?';

  @override
  String get trainingQ5a => 'Ничего не отмечать до конца дня';

  @override
  String get trainingQ5b => 'Отмечать этапы как обычно: они уйдут сами';

  @override
  String get trainingQ5c => 'Звонить родителю';

  @override
  String get trainingQ6 => 'Задерживаетесь на 10 минут. Правильное действие:';

  @override
  String get trainingQ6a => 'Ехать молча и наверстать по дороге';

  @override
  String get trainingQ6b => 'Отметить задержку с причиной';

  @override
  String get trainingQ6c => 'Сказать родителю после поездки';

  @override
  String get trainingQ7 => 'Незнакомый человек просит отдать ему ребёнка:';

  @override
  String get trainingQ7a => 'Отдать, если он говорит, что это дядя';

  @override
  String get trainingQ7b => 'Не отдавать и звонить диспетчеру';

  @override
  String get trainingQ7c => 'Отдать, если ребёнок его узнал';

  @override
  String get trainingQ8 =>
      'В машине трое детей из разных семей. Кодовое слово:';

  @override
  String get trainingQ8a => 'Одно на всю машину';

  @override
  String get trainingQ8b => 'Своё у каждой семьи';

  @override
  String get trainingQ8c => 'Не нужно, если едут вместе';

  @override
  String get trainingQ9 => 'Завтрашние поездки водитель подтверждает:';

  @override
  String get trainingQ9a => 'Утром перед выездом';

  @override
  String get trainingQ9b => 'До 20:00 накануне';

  @override
  String get trainingQ9c => 'Не подтверждает';

  @override
  String get trainingQ10 =>
      'Ребёнку нужно детское кресло, а свободного кресла нет:';

  @override
  String get trainingQ10a => 'Везти аккуратно без кресла';

  @override
  String get trainingQ10b => 'Сообщить диспетчеру: ехать нельзя';

  @override
  String get trainingQ10c => 'Посадить на колени взрослому';

  @override
  String get ownerTitle => 'Отчёты';

  @override
  String get ownerToday => 'Сегодня';

  @override
  String get ownerWeek => 'Неделя';

  @override
  String get ownerMonth => 'Месяц';

  @override
  String get ownerRides => 'Поездок';

  @override
  String get ownerCompleted => 'Довезли';

  @override
  String get ownerCancelled => 'Сорвано';

  @override
  String get ownerCompletion => 'Выполняемость';

  @override
  String get ownerRevenue => 'Выручка';

  @override
  String get ownerSmsCost => 'SMS';

  @override
  String get ownerDriverPay => 'Водителям';

  @override
  String get ownerMargin => 'Валовая маржа';

  @override
  String get ownerDriverLoad => 'Загрузка водителей';

  @override
  String get ownerRouteEconomics => 'Экономика маршрутов';

  @override
  String get ownerEmptyHours => 'Пустые часы';

  @override
  String get ownerNoEmptyHours => 'Пустых часов нет';

  @override
  String get ownerBalances => 'Балансы семей';

  @override
  String ownerInDebt(int count) {
    return 'В минусе: $count';
  }

  @override
  String get ownerRidesPerBlock => 'Поездок на блок';

  @override
  String get ownerExport => 'Выгрузить таблицу';

  @override
  String get ownerExportHint =>
      'Ссылка сработает один раз и только 15 минут. Откройте её на компьютере — файл открывается в Excel.';

  @override
  String get ownerExportCopy => 'Скопировать ссылку';

  @override
  String get ownerRates => 'Ставки расчёта';

  @override
  String get ownerSmsPrice => 'SMS, тенге';

  @override
  String get ownerBlockPay => 'Блок, тенге';

  @override
  String get ownerPerRide => 'Поездка, тенге';

  @override
  String get ownerLossMaking => 'Убыточный маршрут';

  @override
  String get taskSystemDegraded => 'Сбой сервиса';
}
