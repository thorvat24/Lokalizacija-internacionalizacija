// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get title => 'F1 trasları 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Avstraliya Qran Prisi',
      'china': 'Çin Qran Prisi',
      'japan': 'Yaponiya Qran Prisi',
      'miami': 'Mayami Qran Prisi',
      'canada': 'Kanada Qran Prisi',
      'monaco': 'Monako Qran Prisi',
      'barcelona': 'Barselona-Kataloniya Qran Prisi',
      'austria': 'Avstriya Qran Prisi',
      'greatBritain': 'Böyük Britaniya Qran Prisi',
      'belgium': 'Belçika Qran Prisi',
      'hungary': 'Macarıstan Qran Prisi',
      'netherlands': 'Niderland Qran Prisi',
      'italy': 'İtaliya Qran Prisi',
      'spain': 'İspaniya Qran Prisi',
      'azerbaijan': 'Azərbaycan Qran Prisi',
      'bahrain': 'Bəhreyn Qran Prisi (Malayziyada)',
      'singapore': 'Sinqapur Qran Prisi',
      'unitedStates': 'ABŞ Qran Prisi',
      'mexicoCity': 'Mexiko Qran Prisi',
      'saoPaulo': 'San-Paulu Qran Prisi',
      'lasVegas': 'Las-Veqas Qran Prisi',
      'qatar': 'Qətər Qran Prisi',
      'abuDhabi': 'Əbu-Dabi Qran Prisi',
      'other': 'Naməlum yarış',
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
      'other': 'Naməlum tras',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Yarışın keçirildiyi tras: $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilet kateqoriyası',
      zero: 'Bilet kateqoriyası yoxdur',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Ümumi giriş',
      'grandstand': 'Tribuna',
      'vip': 'VIP',
      'other': 'Digər bilet kateqoriyası',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'Keçmiş',
      'upcoming': 'Qarşıdakı',
      'other': 'Hamısı',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yarış',
      zero: 'Yarış yoxdur',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'Tras';

  @override
  String get raceDateUtcLabel => 'Yarışın tarixi (UTC)';

  @override
  String get raceStartUtcLabel => 'Yarışın başlanğıcı (UTC)';

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
  String get displayRegionLabel => 'Göstərilən region';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'Trasın regionu',
      'germany': 'Alman dili',
      'czechia': 'Çexiya',
      'english': 'İngilis dili (Birləşmiş Krallıq)',
      'other': 'Mənim regionum',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'Yarışın tarixi';

  @override
  String get raceStartLabel => 'Yarışın başlanğıcı';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }

  @override
  String raceDayTicketPrices(String currency) {
    return 'Yarış günü üçün bilet qiymətləri ($currency)';
  }

  @override
  String get sampleTicketPrices =>
      'Qiymətlər və valyuta məzənnələri nümunə üçündür.';
}
