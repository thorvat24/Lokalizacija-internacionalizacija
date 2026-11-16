/// Grand Prix rounds in the order of the revised 2026 calendar.
/// Race start times are the scheduled UTC times on the event pages.
/// https://www.formula1.com/en/racing/2026
enum Race2026 {
  australia(3, 8, 4),
  china(3, 15, 7),
  japan(3, 29, 5),
  miami(5, 3, 17),
  canada(5, 24, 20),
  monaco(6, 7, 13),
  barcelona(6, 14, 13),
  austria(6, 28, 13),
  greatBritain(7, 5, 14),
  belgium(7, 19, 13),
  hungary(7, 26, 13),
  netherlands(8, 23, 13),
  italy(9, 6, 13),
  spain(9, 13, 13),
  azerbaijan(9, 26, 11),
  bahrain(10, 4, 7),
  singapore(10, 11, 12),
  unitedStates(10, 25, 20),
  mexicoCity(11, 1, 20),
  saoPaulo(11, 8, 17),
  lasVegas(11, 22, 4),
  qatar(11, 29, 16),
  abuDhabi(12, 6, 13);

  const Race2026(this._month, this._day, this._hour);

  final int _month;
  final int _day;
  final int _hour;

  DateTime get startUtc => DateTime.utc(2026, _month, _day, _hour);
}
