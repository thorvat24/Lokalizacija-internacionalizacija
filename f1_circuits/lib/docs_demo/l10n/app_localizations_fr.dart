// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get title => 'Circuits de F1 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Grand Prix d’Australie',
      'china': 'Grand Prix de Chine',
      'japan': 'Grand Prix du Japon',
      'miami': 'Grand Prix de Miami',
      'canada': 'Grand Prix du Canada',
      'monaco': 'Grand Prix de Monaco',
      'barcelona': 'Grand Prix de Barcelone-Catalogne',
      'austria': 'Grand Prix d’Autriche',
      'greatBritain': 'Grand Prix de Grande-Bretagne',
      'belgium': 'Grand Prix de Belgique',
      'hungary': 'Grand Prix de Hongrie',
      'netherlands': 'Grand Prix des Pays-Bas',
      'italy': 'Grand Prix d’Italie',
      'spain': 'Grand Prix d’Espagne',
      'azerbaijan': 'Grand Prix d’Azerbaïdjan',
      'bahrain': 'Grand Prix de Bahreïn en Malaisie',
      'singapore': 'Grand Prix de Singapour',
      'unitedStates': 'Grand Prix des États-Unis',
      'mexicoCity': 'Grand Prix de Mexico',
      'saoPaulo': 'Grand Prix de São Paulo',
      'lasVegas': 'Grand Prix de Las Vegas',
      'qatar': 'Grand Prix du Qatar',
      'abuDhabi': 'Grand Prix d’Abou Dabi',
      'other': 'Course inconnue',
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
      'other': 'Circuit inconnu',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Course sur le circuit $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count catégories de billets',
      one: '$count catégorie de billets',
      zero: 'Aucune catégorie de billets',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Admission générale',
      'grandstand': 'Tribune',
      'vip': 'VIP',
      'other': 'Autre catégorie de billets',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'Passées',
      'upcoming': 'À venir',
      'other': 'Toutes',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count courses',
      one: '$count course',
      zero: 'Aucune course',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'Circuit';

  @override
  String get raceDateUtcLabel => 'Date de la course (UTC)';

  @override
  String get raceStartUtcLabel => 'Départ de la course (UTC)';

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
  String get displayRegionLabel => 'Région d’affichage';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'Région du circuit',
      'germany': 'Allemand',
      'czechia': 'Tchéquie',
      'english': 'Anglais (Royaume-Uni)',
      'other': 'Ma région',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'Date de la course';

  @override
  String get raceStartLabel => 'Départ de la course';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }

  @override
  String raceDayTicketPrices(String currency) {
    return 'Prix des billets pour le jour de la course ($currency)';
  }

  @override
  String get sampleTicketPrices =>
      'Prix et taux de change donnés à titre d’exemple.';

  @override
  String get demoEscapedZone => 'Fuseau horaire: {UTC}';

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
