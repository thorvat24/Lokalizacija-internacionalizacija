enum TicketCategory { generalAdmission, grandstand, vip }

/// Fixed teaching rates in units of each currency per euro.
enum TicketCurrency {
  eur('EUR', 1),
  aed('AED', 4),
  aud('AUD', 1.65),
  azn('AZN', 1.85),
  brl('BRL', 5.5),
  cad('CAD', 1.5),
  cny('CNY', 7.8),
  czk('CZK', 25),
  gbp('GBP', 0.85),
  huf('HUF', 400),
  jpy('JPY', 165),
  mxn('MXN', 20),
  myr('MYR', 4.8),
  qar('QAR', 4),
  sgd('SGD', 1.45),
  usd('USD', 1.1);

  const TicketCurrency(this.code, this.unitsPerEuro);

  final String code;
  final double unitsPerEuro;
}

/// Illustrative race-day amounts stored in euros.
class TicketPrices {
  const TicketPrices(this.generalAdmission, this.grandstand, this.vip);

  final int generalAdmission;
  final int grandstand;
  final int vip;

  int eurosFor(TicketCategory category) => switch (category) {
    TicketCategory.generalAdmission => generalAdmission,
    TicketCategory.grandstand => grandstand,
    TicketCategory.vip => vip,
  };
}
