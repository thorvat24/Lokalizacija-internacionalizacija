// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get title => 'F1-es pályák 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Ausztrál Nagydíj',
      'china': 'Kínai Nagydíj',
      'japan': 'Japán Nagydíj',
      'miami': 'Miami Nagydíj',
      'canada': 'Kanadai Nagydíj',
      'monaco': 'Monacói Nagydíj',
      'barcelona': 'Barcelona–katalóniai Nagydíj',
      'austria': 'Osztrák Nagydíj',
      'greatBritain': 'Brit Nagydíj',
      'belgium': 'Belga Nagydíj',
      'hungary': 'Magyar Nagydíj',
      'netherlands': 'Holland Nagydíj',
      'italy': 'Olasz Nagydíj',
      'spain': 'Spanyol Nagydíj',
      'azerbaijan': 'Azerbajdzsáni Nagydíj',
      'bahrain': 'Bahreini Nagydíj (Malajziában)',
      'singapore': 'Szingapúri Nagydíj',
      'unitedStates': 'Egyesült Államok Nagydíj',
      'mexicoCity': 'Mexikóvárosi Nagydíj',
      'saoPaulo': 'São Pauló-i Nagydíj',
      'lasVegas': 'Las Vegas-i Nagydíj',
      'qatar': 'Katari Nagydíj',
      'abuDhabi': 'Abu-dzabi Nagydíj',
      'other': 'Ismeretlen futam',
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
      'other': 'Ismeretlen versenypálya',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Futam a következő pályán: $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jegykategória',
      zero: 'Nincs jegykategória',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Általános belépő',
      'grandstand': 'Tribün',
      'vip': 'VIP',
      'other': 'Egyéb jegykategória',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'Korábbi',
      'upcoming': 'Közelgő',
      'other': 'Összes',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count futam',
      zero: 'Nincs futam',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'Versenypálya';

  @override
  String get raceDateUtcLabel => 'A futam dátuma (UTC)';

  @override
  String get raceStartUtcLabel => 'A futam rajtja (UTC)';

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
  String get displayRegionLabel => 'Megjelenítési régió';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'A versenypálya régiója',
      'germany': 'Német',
      'czechia': 'Csehország',
      'english': 'Angol (Egyesült Királyság)',
      'other': 'Saját régió',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'A futam dátuma';

  @override
  String get raceStartLabel => 'A futam rajtja';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }

  @override
  String raceDayTicketPrices(String currency) {
    return 'A futam napjára szóló jegyárak ($currency)';
  }

  @override
  String get sampleTicketPrices => 'Példaárak és példaárfolyamok.';
}
