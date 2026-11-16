import 'package:f1_circuits/race_2026.dart';
import 'package:f1_circuits/ticket_pricing.dart';
import 'package:flutter/widgets.dart';

enum DisplayRegion {
  myRegion(Locale('hr', 'HR'), 'Europe/Zagreb', TicketCurrency.eur),
  raceRegion(null, null, null),
  czechia(Locale('cs', 'CZ'), 'Europe/Prague', TicketCurrency.czk),
  english(Locale('en', 'GB'), 'Europe/London', TicketCurrency.gbp),
  germany(Locale('de', 'DE'), 'Europe/Berlin', TicketCurrency.eur);

  const DisplayRegion(this.locale, this.timeZone, this.currency);

  final Locale? locale;
  final String? timeZone;
  final TicketCurrency? currency;

  static const shared = [myRegion, czechia, english, germany];
  static const forRace = [myRegion, raceRegion, czechia, english, germany];

  ({Locale locale, String timeZone, TicketCurrency currency}) settings(
    Race2026 race,
  ) {
    if ((locale, timeZone, currency) case (
      final regionLocale?,
      final zone?,
      final regionCurrency?,
    )) {
      return (locale: regionLocale, timeZone: zone, currency: regionCurrency);
    }

    return (
      locale: race.interfaceLocale,
      timeZone: race.timeZone,
      currency: race.currency,
    );
  }
}
