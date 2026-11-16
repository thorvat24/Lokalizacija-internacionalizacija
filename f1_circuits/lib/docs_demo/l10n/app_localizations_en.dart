// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'F1 Circuits 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Australian Grand Prix',
      'china': 'Chinese Grand Prix',
      'japan': 'Japanese Grand Prix',
      'miami': 'Miami Grand Prix',
      'canada': 'Canadian Grand Prix',
      'monaco': 'Monaco Grand Prix',
      'barcelona': 'Barcelona-Catalunya Grand Prix',
      'austria': 'Austrian Grand Prix',
      'greatBritain': 'British Grand Prix',
      'belgium': 'Belgian Grand Prix',
      'hungary': 'Hungarian Grand Prix',
      'netherlands': 'Dutch Grand Prix',
      'italy': 'Italian Grand Prix',
      'spain': 'Spanish Grand Prix',
      'azerbaijan': 'Azerbaijan Grand Prix',
      'bahrain': 'Bahrain Grand Prix in Malaysia',
      'singapore': 'Singapore Grand Prix',
      'unitedStates': 'United States Grand Prix',
      'mexicoCity': 'Mexico City Grand Prix',
      'saoPaulo': 'São Paulo Grand Prix',
      'lasVegas': 'Las Vegas Grand Prix',
      'qatar': 'Qatar Grand Prix',
      'abuDhabi': 'Abu Dhabi Grand Prix',
      'other': 'Unknown race',
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
      'other': 'Unknown circuit',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Race at $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ticket categories',
      one: '$count ticket category',
      zero: 'No ticket categories',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'General admission',
      'grandstand': 'Grandstand',
      'vip': 'VIP',
      'other': 'Other ticket category',
    });
    return '$_temp0';
  }
}
