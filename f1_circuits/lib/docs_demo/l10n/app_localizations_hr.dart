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
  String get lasVegasCircuitName => 'Las Vegas Strip Circuit';

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
