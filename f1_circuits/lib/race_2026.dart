import 'package:flutter/widgets.dart';

/// Grand Prix rounds in the order of the revised 2026 calendar.
/// Race start times are the scheduled UTC times on the event pages.
/// https://www.formula1.com/en/racing/2026
enum Race2026 {
  australia(3, 8, 4, 'en_AU', 'Australia/Melbourne'),
  china(3, 15, 7, 'zh_CN', 'Asia/Shanghai'),
  japan(3, 29, 5, 'ja_JP', 'Asia/Tokyo'),
  miami(5, 3, 17, 'en_US', 'America/New_York'),
  canada(5, 24, 20, 'fr_CA', 'America/Toronto'),
  monaco(6, 7, 13, 'fr_MC', 'Europe/Monaco'),
  barcelona(6, 14, 13, 'es_ES', 'Europe/Madrid'),
  austria(6, 28, 13, 'de_AT', 'Europe/Vienna'),
  greatBritain(7, 5, 14, 'en_GB', 'Europe/London'),
  belgium(7, 19, 13, 'fr_BE', 'Europe/Brussels'),
  hungary(7, 26, 13, 'hu_HU', 'Europe/Budapest'),
  netherlands(8, 23, 13, 'nl_NL', 'Europe/Amsterdam'),
  italy(9, 6, 13, 'it_IT', 'Europe/Rome'),
  spain(9, 13, 13, 'es_ES', 'Europe/Madrid'),
  azerbaijan(9, 26, 11, 'az_AZ', 'Asia/Baku'),
  bahrain(10, 4, 7, 'ms_MY', 'Asia/Kuala_Lumpur'),
  singapore(10, 11, 12, 'en_SG', 'Asia/Singapore'),
  unitedStates(10, 25, 20, 'en_US', 'America/Chicago'),
  mexicoCity(11, 1, 20, 'es_MX', 'America/Mexico_City'),
  saoPaulo(11, 8, 17, 'pt_BR', 'America/Sao_Paulo'),
  lasVegas(11, 22, 4, 'en_US', 'America/Los_Angeles'),
  qatar(11, 29, 16, 'ar_QA', 'Asia/Qatar'),
  abuDhabi(12, 6, 13, 'ar_AE', 'Asia/Dubai');

  const Race2026(
    this._month,
    this._day,
    this._hour,
    this.locale,
    this.timeZone,
  );

  final int _month;
  final int _day;
  final int _hour;
  final String locale;
  final String timeZone;

  Locale get interfaceLocale {
    final [language, country] = locale.split('_');
    return Locale(language, country);
  }

  DateTime get startUtc => DateTime.utc(2026, _month, _day, _hour);
}
