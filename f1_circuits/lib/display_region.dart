import 'package:f1_circuits/race_2026.dart';
import 'package:flutter/widgets.dart';

enum DisplayRegion {
  myRegion(Locale('hr', 'HR'), 'Europe/Zagreb'),
  raceRegion(null, null),
  czechia(Locale('cs', 'CZ'), 'Europe/Prague'),
  english(Locale('en', 'GB'), 'Europe/London'),
  germany(Locale('de', 'DE'), 'Europe/Berlin');

  const DisplayRegion(this.locale, this.timeZone);

  final Locale? locale;
  final String? timeZone;

  static const shared = [myRegion, czechia, english, germany];
  static const forRace = [myRegion, raceRegion, czechia, english, germany];

  ({Locale locale, String timeZone}) settings(Race2026 race) {
    if ((locale, timeZone) case (final regionLocale?, final zone?)) {
      return (locale: regionLocale, timeZone: zone);
    }

    return (locale: race.interfaceLocale, timeZone: race.timeZone);
  }
}
