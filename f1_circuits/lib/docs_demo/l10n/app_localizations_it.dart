// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get title => 'Circuiti di F1 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Gran Premio d’Australia',
      'china': 'Gran Premio di Cina',
      'japan': 'Gran Premio del Giappone',
      'miami': 'Gran Premio di Miami',
      'canada': 'Gran Premio del Canada',
      'monaco': 'Gran Premio di Monaco',
      'barcelona': 'Gran Premio di Barcellona-Catalogna',
      'austria': 'Gran Premio d’Austria',
      'greatBritain': 'Gran Premio di Gran Bretagna',
      'belgium': 'Gran Premio del Belgio',
      'hungary': 'Gran Premio d’Ungheria',
      'netherlands': 'Gran Premio dei Paesi Bassi',
      'italy': 'Gran Premio d’Italia',
      'spain': 'Gran Premio di Spagna',
      'azerbaijan': 'Gran Premio dell’Azerbaigian',
      'bahrain': 'Gran Premio del Bahrein in Malesia',
      'singapore': 'Gran Premio di Singapore',
      'unitedStates': 'Gran Premio degli Stati Uniti',
      'mexicoCity': 'Gran Premio di Città del Messico',
      'saoPaulo': 'Gran Premio di San Paolo',
      'lasVegas': 'Gran Premio di Las Vegas',
      'qatar': 'Gran Premio del Qatar',
      'abuDhabi': 'Gran Premio di Abu Dhabi',
      'other': 'Gara sconosciuta',
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
      'other': 'Circuito sconosciuto',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Gara sul circuito $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorie di biglietti',
      one: '$count categoria di biglietti',
      zero: 'Nessuna categoria di biglietti',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Ingresso generale',
      'grandstand': 'Tribuna',
      'vip': 'VIP',
      'other': 'Altra categoria di biglietti',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'Passate',
      'upcoming': 'In programma',
      'other': 'Tutte',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gare',
      one: '$count gara',
      zero: 'Nessuna gara',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'Circuito';

  @override
  String get raceDateUtcLabel => 'Data della gara (UTC)';

  @override
  String get raceStartUtcLabel => 'Partenza della gara (UTC)';

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
  String get displayRegionLabel => 'Regione di visualizzazione';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'Regione del circuito',
      'germany': 'Tedesco',
      'czechia': 'Cechia',
      'english': 'Inglese (Regno Unito)',
      'other': 'La mia regione',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'Data della gara';

  @override
  String get raceStartLabel => 'Partenza della gara';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }
}
