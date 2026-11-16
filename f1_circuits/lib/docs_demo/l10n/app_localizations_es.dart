// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get title => 'Circuitos de F1 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Gran Premio de Australia',
      'china': 'Gran Premio de China',
      'japan': 'Gran Premio de Japón',
      'miami': 'Gran Premio de Miami',
      'canada': 'Gran Premio de Canadá',
      'monaco': 'Gran Premio de Mónaco',
      'barcelona': 'Gran Premio de Barcelona-Cataluña',
      'austria': 'Gran Premio de Austria',
      'greatBritain': 'Gran Premio de Gran Bretaña',
      'belgium': 'Gran Premio de Bélgica',
      'hungary': 'Gran Premio de Hungría',
      'netherlands': 'Gran Premio de los Países Bajos',
      'italy': 'Gran Premio de Italia',
      'spain': 'Gran Premio de España',
      'azerbaijan': 'Gran Premio de Azerbaiyán',
      'bahrain': 'Gran Premio de Baréin en Malasia',
      'singapore': 'Gran Premio de Singapur',
      'unitedStates': 'Gran Premio de Estados Unidos',
      'mexicoCity': 'Gran Premio de la Ciudad de México',
      'saoPaulo': 'Gran Premio de São Paulo',
      'lasVegas': 'Gran Premio de Las Vegas',
      'qatar': 'Gran Premio de Catar',
      'abuDhabi': 'Gran Premio de Abu Dabi',
      'other': 'Carrera desconocida',
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
      'other': 'Circuito desconocido',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Carrera en el circuito $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count categorías de entradas',
      one: '$count categoría de entradas',
      zero: 'No hay categorías de entradas',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Entrada general',
      'grandstand': 'Tribuna',
      'vip': 'VIP',
      'other': 'Otra categoría de entradas',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'Pasadas',
      'upcoming': 'Próximas',
      'other': 'Todas',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count carreras',
      one: '$count carrera',
      zero: 'No hay carreras',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'Circuito';

  @override
  String get raceDateUtcLabel => 'Fecha de la carrera (UTC)';

  @override
  String get raceStartUtcLabel => 'Inicio de la carrera (UTC)';

  @override
  String raceDateValue(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String raceTimeValue(DateTime time) {
    final intl.DateFormat timeDateFormat = intl.DateFormat.jm(localeName);
    final String timeString = timeDateFormat.format(time);

    return '$timeString';
  }

  @override
  String get displayRegionLabel => 'Región de visualización';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'Región del circuito',
      'germany': 'Alemán',
      'czechia': 'Chequia',
      'english': 'Inglés (Reino Unido)',
      'other': 'Mi región',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'Fecha de la carrera';

  @override
  String get raceStartLabel => 'Inicio de la carrera';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }

  @override
  String raceDayTicketPrices(String currency) {
    return 'Precios de las entradas para el día de la carrera ($currency)';
  }

  @override
  String get sampleTicketPrices => 'Precios y tipos de cambio de ejemplo.';

  @override
  String get demoEscapedZone => 'Zona horaria: {UTC}';

  @override
  String demoShortDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String demoFormatUsd(num amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.simpleCurrency(locale: localeName, name: 'USD');
    final String amountString = amountNumberFormat.format(amount);

    return '$amountString';
  }

  @override
  String demoCompactHuf(num amount) {
    final intl.NumberFormat amountNumberFormat =
        intl.NumberFormat.compactCurrency(
          locale: localeName,
          name: 'HUF',
          decimalDigits: 1,
        );
    final String amountString = amountNumberFormat.format(amount);

    return '$amountString';
  }
}
