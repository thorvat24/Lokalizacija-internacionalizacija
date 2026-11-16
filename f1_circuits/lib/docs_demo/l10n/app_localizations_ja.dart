// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get title => 'F1サーキット 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'オーストラリアGP',
      'china': '中国GP',
      'japan': '日本GP',
      'miami': 'マイアミGP',
      'canada': 'カナダGP',
      'monaco': 'モナコGP',
      'barcelona': 'バルセロナ・カタルーニャGP',
      'austria': 'オーストリアGP',
      'greatBritain': 'イギリスGP',
      'belgium': 'ベルギーGP',
      'hungary': 'ハンガリーGP',
      'netherlands': 'オランダGP',
      'italy': 'イタリアGP',
      'spain': 'スペインGP',
      'azerbaijan': 'アゼルバイジャンGP',
      'bahrain': 'バーレーン（マレーシア開催）GP',
      'singapore': 'シンガポールGP',
      'unitedStates': 'アメリカGP',
      'mexicoCity': 'メキシコシティGP',
      'saoPaulo': 'サンパウロGP',
      'lasVegas': 'ラスベガスGP',
      'qatar': 'カタールGP',
      'abuDhabi': 'アブダビGP',
      'other': '不明なレース',
    });
    return '$_temp0';
  }

  @override
  String circuitName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Albert Park Grand Prix Circuit',
      'china': 'Shanghai International Circuit',
      'japan': 'Suzuka International Racing Course',
      'miami': 'Miami International Autodrome',
      'canada': 'Circuit Gilles-Villeneuve',
      'monaco': 'Circuit de Monaco',
      'barcelona': 'Circuit de Barcelona-Catalunya',
      'austria': 'Red Bull Ring',
      'greatBritain': 'Silverstone Circuit',
      'belgium': 'Circuit de Spa-Francorchamps',
      'hungary': 'Hungaroring',
      'netherlands': 'Circuit Zandvoort',
      'italy': 'Autodromo Nazionale Monza',
      'spain': 'Madring',
      'azerbaijan': 'Baku City Circuit',
      'bahrain': 'Sepang International Circuit',
      'singapore': 'Marina Bay Street Circuit',
      'unitedStates': 'Circuit of the Americas',
      'mexicoCity': 'Autódromo Hermanos Rodríguez',
      'saoPaulo': 'Autódromo José Carlos Pace (Interlagos)',
      'lasVegas': 'Las Vegas Strip Circuit',
      'qatar': 'Lusail International Circuit',
      'abuDhabi': 'Yas Marina Circuit',
      'other': '不明なサーキット',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return '$circuitNameでのレース';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count種類のチケット',
      zero: 'チケット区分はありません',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': '自由観戦エリア',
      'grandstand': 'グランドスタンド',
      'vip': 'VIP',
      'other': 'その他のチケット区分',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': '過去のレース',
      'upcoming': '今後のレース',
      'other': 'すべて',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のレース',
      zero: 'レースはありません',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'サーキット';

  @override
  String get raceDateUtcLabel => '決勝日 (UTC)';

  @override
  String get raceStartUtcLabel => '決勝開始時刻 (UTC)';

  @override
  String raceDateValue(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String raceTimeValue(DateTime time) {
    final intl.DateFormat timeDateFormat = intl.DateFormat.jm(localeName);
    final String timeString = timeDateFormat.format(time);

    return '$timeString';
  }

  @override
  String get displayRegionLabel => '表示地域';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': '開催地の地域',
      'germany': 'ドイツ語',
      'czechia': 'チェコ',
      'english': '英語（イギリス）',
      'other': '端末の地域',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => '決勝日';

  @override
  String get raceStartLabel => '決勝開始時刻';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }

  @override
  String raceDayTicketPrices(String currency) {
    return '決勝日のチケット料金（$currency）';
  }

  @override
  String get sampleTicketPrices => '料金と為替レートはサンプルです。';

  @override
  String get demoEscapedZone => 'タイムゾーン: {UTC}';

  @override
  String demoShortDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String demoFormatUsd(num amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.simpleCurrency(locale: localeName, name: 'USD');
    final String amountString = amountNumberFormat.format(amount);

    return '$amountString';
  }

  @override
  String demoCompactHuf(num amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.compactCurrency(
          locale: localeName,
          name: 'HUF',
          decimalDigits: 1,
        );
    final String amountString = amountNumberFormat.format(amount);

    return '$amountString';
  }
}
