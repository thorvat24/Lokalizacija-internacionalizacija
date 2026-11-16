// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get title => 'F1-Rennstrecken 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Großer Preis von Australien',
      'china': 'Großer Preis von China',
      'japan': 'Großer Preis von Japan',
      'miami': 'Großer Preis von Miami',
      'canada': 'Großer Preis von Kanada',
      'monaco': 'Großer Preis von Monaco',
      'barcelona': 'Großer Preis von Barcelona-Katalonien',
      'austria': 'Großer Preis von Österreich',
      'greatBritain': 'Großer Preis von Großbritannien',
      'belgium': 'Großer Preis von Belgien',
      'hungary': 'Großer Preis von Ungarn',
      'netherlands': 'Großer Preis der Niederlande',
      'italy': 'Großer Preis von Italien',
      'spain': 'Großer Preis von Spanien',
      'azerbaijan': 'Großer Preis von Aserbaidschan',
      'bahrain': 'Großer Preis von Bahrain in Malaysia',
      'singapore': 'Großer Preis von Singapur',
      'unitedStates': 'Großer Preis der USA',
      'mexicoCity': 'Großer Preis von Mexiko-Stadt',
      'saoPaulo': 'Großer Preis von São Paulo',
      'lasVegas': 'Großer Preis von Las Vegas',
      'qatar': 'Großer Preis von Katar',
      'abuDhabi': 'Großer Preis von Abu Dhabi',
      'other': 'Unbekanntes Rennen',
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
      'other': 'Unbekannte Rennstrecke',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Rennen auf der Strecke $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Ticketkategorien',
      one: '$count Ticketkategorie',
      zero: 'Keine Ticketkategorien',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Stehplatz',
      'grandstand': 'Tribüne',
      'vip': 'VIP',
      'other': 'Andere Ticketkategorie',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'Vergangene',
      'upcoming': 'Bevorstehende',
      'other': 'Alle',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Rennen',
      one: '$count Rennen',
      zero: 'Keine Rennen',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'Rennstrecke';

  @override
  String get raceDateUtcLabel => 'Renndatum (UTC)';

  @override
  String get raceStartUtcLabel => 'Rennstart (UTC)';

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
  String get displayRegionLabel => 'Anzeigeregion';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'Region der Rennstrecke',
      'germany': 'Deutsch',
      'czechia': 'Tschechien',
      'english': 'Englisch (UK)',
      'other': 'Meine Region',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'Renndatum';

  @override
  String get raceStartLabel => 'Rennstart';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }

  @override
  String raceDayTicketPrices(String currency) {
    return 'Ticketpreise für den Renntag ($currency)';
  }

  @override
  String get sampleTicketPrices => 'Beispielpreise und Beispielwechselkurse.';

  @override
  String get demoEscapedZone => 'Zeitzone: {UTC}';

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
