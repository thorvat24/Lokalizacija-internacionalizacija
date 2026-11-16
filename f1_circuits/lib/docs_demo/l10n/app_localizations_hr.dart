// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get title => 'F1 staze 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Velika nagrada Australije',
      'china': 'Velika nagrada Kine',
      'japan': 'Velika nagrada Japana',
      'miami': 'Velika nagrada Miamija',
      'canada': 'Velika nagrada Kanade',
      'monaco': 'Velika nagrada Monaka',
      'barcelona': 'Velika nagrada Barcelone i Katalonije',
      'austria': 'Velika nagrada Austrije',
      'greatBritain': 'Velika nagrada Velike Britanije',
      'belgium': 'Velika nagrada Belgije',
      'hungary': 'Velika nagrada Mađarske',
      'netherlands': 'Velika nagrada Nizozemske',
      'italy': 'Velika nagrada Italije',
      'spain': 'Velika nagrada Španjolske',
      'azerbaijan': 'Velika nagrada Azerbajdžana',
      'bahrain': 'Velika nagrada Bahreina u Maleziji',
      'singapore': 'Velika nagrada Singapura',
      'unitedStates': 'Velika nagrada SAD-a',
      'mexicoCity': 'Velika nagrada Ciudad de Méxica',
      'saoPaulo': 'Velika nagrada São Paula',
      'lasVegas': 'Velika nagrada Las Vegasa',
      'qatar': 'Velika nagrada Katara',
      'abuDhabi': 'Velika nagrada Abu Dhabija',
      'other': 'Nepoznata utrka',
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
      'other': 'Nepoznata staza',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Utrka na stazi $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kategorija ulaznica',
      few: '$count kategorije ulaznica',
      one: '$count kategorija ulaznica',
      zero: 'Nema kategorija ulaznica',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Opći ulaz',
      'grandstand': 'Tribina',
      'vip': 'VIP',
      'other': 'Druga kategorija ulaznica',
    });
    return '$_temp0';
  }
}
