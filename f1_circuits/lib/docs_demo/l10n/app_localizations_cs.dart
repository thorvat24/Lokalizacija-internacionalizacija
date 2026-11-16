// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get title => 'Okruhy F1 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Velká cena Austrálie',
      'china': 'Velká cena Číny',
      'japan': 'Velká cena Japonska',
      'miami': 'Velká cena Miami',
      'canada': 'Velká cena Kanady',
      'monaco': 'Velká cena Monaka',
      'barcelona': 'Velká cena Barcelony-Katalánska',
      'austria': 'Velká cena Rakouska',
      'greatBritain': 'Velká cena Velké Británie',
      'belgium': 'Velká cena Belgie',
      'hungary': 'Velká cena Maďarska',
      'netherlands': 'Velká cena Nizozemska',
      'italy': 'Velká cena Itálie',
      'spain': 'Velká cena Španělska',
      'azerbaijan': 'Velká cena Ázerbájdžánu',
      'bahrain': 'Velká cena Bahrajnu v Malajsii',
      'singapore': 'Velká cena Singapuru',
      'unitedStates': 'Velká cena USA',
      'mexicoCity': 'Velká cena Mexico City',
      'saoPaulo': 'Velká cena São Paula',
      'lasVegas': 'Velká cena Las Vegas',
      'qatar': 'Velká cena Kataru',
      'abuDhabi': 'Velká cena Abú Zabí',
      'other': 'Neznámý závod',
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
      'other': 'Neznámý okruh',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Závod na okruhu $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategorií vstupenek',
      few: '$count kategorie vstupenek',
      one: '$count kategorie vstupenek',
      zero: 'Žádné kategorie vstupenek',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Všeobecný vstup',
      'grandstand': 'Tribuna',
      'vip': 'VIP',
      'other': 'Jiná kategorie vstupenek',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'Uplynulé',
      'upcoming': 'Nadcházející',
      'other': 'Všechny',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count závodů',
      few: '$count závody',
      one: '$count závod',
      zero: 'Žádné závody',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'Okruh';

  @override
  String get raceDateUtcLabel => 'Datum závodu (UTC)';

  @override
  String get raceStartUtcLabel => 'Start závodu (UTC)';

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
  String get displayRegionLabel => 'Oblast zobrazení';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'Oblast okruhu',
      'czechia': 'Česko',
      'english': 'Angličtina (Spojené království)',
      'germany': 'Němčina',
      'other': 'Moje oblast',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'Datum závodu';

  @override
  String get raceStartLabel => 'Start závodu';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }
}
