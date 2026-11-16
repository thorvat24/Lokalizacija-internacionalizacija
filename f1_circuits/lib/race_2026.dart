import 'package:f1_circuits/ticket_pricing.dart';
import 'package:flutter/widgets.dart';

/// Grand Prix rounds in the order of the revised 2026 calendar.
/// Race start times are the scheduled UTC times on the event pages.
/// https://www.formula1.com/en/racing/2026
enum Race2026 {
  australia(
    3,
    8,
    4,
    'en_AU',
    'Australia/Melbourne',
    currency: TicketCurrency.aud,
    ticketPrices: TicketPrices(145, 300, 900),
  ),
  china(
    3,
    15,
    7,
    'zh_CN',
    'Asia/Shanghai',
    currency: TicketCurrency.cny,
    ticketPrices: TicketPrices(95, 215, 590),
  ),
  japan(
    3,
    29,
    5,
    'ja_JP',
    'Asia/Tokyo',
    currency: TicketCurrency.jpy,
    ticketPrices: TicketPrices(105, 250, 740),
  ),
  miami(
    5,
    3,
    17,
    'en_US',
    'America/New_York',
    currency: TicketCurrency.usd,
    ticketPrices: TicketPrices(180, 390, 1120),
  ),
  canada(
    5,
    24,
    20,
    'fr_CA',
    'America/Toronto',
    currency: TicketCurrency.cad,
    ticketPrices: TicketPrices(135, 280, 830),
  ),
  monaco(
    6,
    7,
    13,
    'fr_MC',
    'Europe/Monaco',
    currency: TicketCurrency.eur,
    ticketPrices: TicketPrices(190, 590, 1750),
  ),
  barcelona(
    6,
    14,
    13,
    'es_ES',
    'Europe/Madrid',
    currency: TicketCurrency.eur,
    ticketPrices: TicketPrices(120, 250, 740),
  ),
  austria(
    6,
    28,
    13,
    'de_AT',
    'Europe/Vienna',
    currency: TicketCurrency.eur,
    ticketPrices: TicketPrices(110, 230, 720),
  ),
  greatBritain(
    7,
    5,
    14,
    'en_GB',
    'Europe/London',
    currency: TicketCurrency.gbp,
    ticketPrices: TicketPrices(185, 370, 1070),
  ),
  belgium(
    7,
    19,
    13,
    'fr_BE',
    'Europe/Brussels',
    currency: TicketCurrency.eur,
    ticketPrices: TicketPrices(125, 280, 840),
  ),
  hungary(
    7,
    26,
    13,
    'hu_HU',
    'Europe/Budapest',
    currency: TicketCurrency.huf,
    ticketPrices: TicketPrices(95, 205, 690),
  ),
  netherlands(
    8,
    23,
    13,
    'nl_NL',
    'Europe/Amsterdam',
    currency: TicketCurrency.eur,
    ticketPrices: TicketPrices(150, 310, 940),
  ),
  italy(
    9,
    6,
    13,
    'it_IT',
    'Europe/Rome',
    currency: TicketCurrency.eur,
    ticketPrices: TicketPrices(125, 295, 870),
  ),
  spain(
    9,
    13,
    13,
    'es_ES',
    'Europe/Madrid',
    currency: TicketCurrency.eur,
    ticketPrices: TicketPrices(135, 290, 880),
  ),
  azerbaijan(
    9,
    26,
    11,
    'az_AZ',
    'Asia/Baku',
    currency: TicketCurrency.azn,
    ticketPrices: TicketPrices(90, 220, 630),
  ),
  bahrain(
    10,
    4,
    7,
    'ms_MY',
    'Asia/Kuala_Lumpur',
    currency: TicketCurrency.myr,
    ticketPrices: TicketPrices(85, 190, 570),
  ),
  singapore(
    10,
    11,
    12,
    'en_SG',
    'Asia/Singapore',
    currency: TicketCurrency.sgd,
    ticketPrices: TicketPrices(175, 390, 1180),
  ),
  unitedStates(
    10,
    25,
    20,
    'en_US',
    'America/Chicago',
    currency: TicketCurrency.usd,
    ticketPrices: TicketPrices(155, 335, 980),
  ),
  mexicoCity(
    11,
    1,
    20,
    'es_MX',
    'America/Mexico_City',
    currency: TicketCurrency.mxn,
    ticketPrices: TicketPrices(120, 320, 910),
  ),
  saoPaulo(
    11,
    8,
    17,
    'pt_BR',
    'America/Sao_Paulo',
    currency: TicketCurrency.brl,
    ticketPrices: TicketPrices(100, 250, 730),
  ),
  lasVegas(
    11,
    22,
    4,
    'en_US',
    'America/Los_Angeles',
    currency: TicketCurrency.usd,
    ticketPrices: TicketPrices(150, 320, 950),
  ),
  qatar(
    11,
    29,
    16,
    'ar_QA',
    'Asia/Qatar',
    currency: TicketCurrency.qar,
    ticketPrices: TicketPrices(110, 230, 700),
  ),
  abuDhabi(
    12,
    6,
    13,
    'ar_AE',
    'Asia/Dubai',
    currency: TicketCurrency.aed,
    ticketPrices: TicketPrices(140, 310, 990),
  );

  const Race2026(
    this._month,
    this._day,
    this._hour,
    this.locale,
    this.timeZone, {
    required this.currency,
    required this.ticketPrices,
  });

  final int _month;
  final int _day;
  final int _hour;
  final String locale;
  final String timeZone;
  final TicketCurrency currency;
  final TicketPrices ticketPrices;

  Locale get interfaceLocale {
    final [language, country] = locale.split('_');
    return Locale(language, country);
  }

  DateTime get startUtc => DateTime.utc(2026, _month, _day, _hour);
}
