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
  String get lasVegasCircuitName => 'Las Vegas Strip Circuit';

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
