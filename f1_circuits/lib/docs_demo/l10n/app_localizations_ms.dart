// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get title => 'Litar F1 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Grand Prix Australia',
      'china': 'Grand Prix China',
      'japan': 'Grand Prix Jepun',
      'miami': 'Grand Prix Miami',
      'canada': 'Grand Prix Kanada',
      'monaco': 'Grand Prix Monaco',
      'barcelona': 'Grand Prix Barcelona-Catalunya',
      'austria': 'Grand Prix Austria',
      'greatBritain': 'Grand Prix Britain',
      'belgium': 'Grand Prix Belgium',
      'hungary': 'Grand Prix Hungary',
      'netherlands': 'Grand Prix Belanda',
      'italy': 'Grand Prix Itali',
      'spain': 'Grand Prix Sepanyol',
      'azerbaijan': 'Grand Prix Azerbaijan',
      'bahrain': 'Grand Prix Bahrain di Malaysia',
      'singapore': 'Grand Prix Singapura',
      'unitedStates': 'Grand Prix Amerika Syarikat',
      'mexicoCity': 'Grand Prix Bandar Raya Mexico',
      'saoPaulo': 'Grand Prix São Paulo',
      'lasVegas': 'Grand Prix Las Vegas',
      'qatar': 'Grand Prix Qatar',
      'abuDhabi': 'Grand Prix Abu Dhabi',
      'other': 'Perlumbaan tidak diketahui',
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
      'other': 'Litar tidak diketahui',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Perlumbaan di litar $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategori tiket',
      zero: 'Tiada kategori tiket',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Kemasukan umum',
      'grandstand': 'Tempat duduk grandstand',
      'vip': 'VIP',
      'other': 'Kategori tiket lain',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'Lepas',
      'upcoming': 'Akan datang',
      'other': 'Semua',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perlumbaan',
      zero: 'Tiada perlumbaan',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'Litar';

  @override
  String get raceDateUtcLabel => 'Tarikh perlumbaan (UTC)';

  @override
  String get raceStartUtcLabel => 'Masa mula perlumbaan (UTC)';

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
  String get displayRegionLabel => 'Rantau paparan';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'Rantau litar',
      'germany': 'Bahasa Jerman',
      'czechia': 'Czechia',
      'english': 'Bahasa Inggeris (UK)',
      'other': 'Rantau saya',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'Tarikh perlumbaan';

  @override
  String get raceStartLabel => 'Masa mula perlumbaan';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }
}
