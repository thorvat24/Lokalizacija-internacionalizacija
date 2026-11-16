// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get title => 'F1-circuits 2026';

  @override
  String raceName(String raceId) {
    String _temp0 = intl.Intl.selectLogic(raceId, {
      'australia': 'Grand Prix van Australië',
      'china': 'Grand Prix van China',
      'japan': 'Grand Prix van Japan',
      'miami': 'Grand Prix van Miami',
      'canada': 'Grand Prix van Canada',
      'monaco': 'Grand Prix van Monaco',
      'barcelona': 'Grand Prix van Barcelona-Catalonië',
      'austria': 'Grand Prix van Oostenrijk',
      'greatBritain': 'Grand Prix van Groot-Brittannië',
      'belgium': 'Grand Prix van België',
      'hungary': 'Grand Prix van Hongarije',
      'netherlands': 'Grand Prix van Nederland',
      'italy': 'Grand Prix van Italië',
      'spain': 'Grand Prix van Spanje',
      'azerbaijan': 'Grand Prix van Azerbeidzjan',
      'bahrain': 'Grand Prix van Bahrein in Maleisië',
      'singapore': 'Grand Prix van Singapore',
      'unitedStates': 'Grand Prix van de Verenigde Staten',
      'mexicoCity': 'Grand Prix van Mexico-Stad',
      'saoPaulo': 'Grand Prix van São Paulo',
      'lasVegas': 'Grand Prix van Las Vegas',
      'qatar': 'Grand Prix van Qatar',
      'abuDhabi': 'Grand Prix van Abu Dhabi',
      'other': 'Onbekende race',
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
      'other': 'Onbekend circuit',
    });
    return '$_temp0';
  }

  @override
  String raceAtCircuit(String circuitName) {
    return 'Race op $circuitName';
  }

  @override
  String ticketCategoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ticketcategorieën',
      one: '$count ticketcategorie',
      zero: 'Geen ticketcategorieën',
    );
    return '$_temp0';
  }

  @override
  String ticketCategory(String category) {
    String _temp0 = intl.Intl.selectLogic(category, {
      'generalAdmission': 'Algemene toegang',
      'grandstand': 'Tribune',
      'vip': 'VIP',
      'other': 'Andere ticketcategorie',
    });
    return '$_temp0';
  }

  @override
  String raceFilter(String filter) {
    String _temp0 = intl.Intl.selectLogic(filter, {
      'past': 'Voorbij',
      'upcoming': 'Aankomend',
      'other': 'Alle',
    });
    return '$_temp0';
  }

  @override
  String raceResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count races',
      one: '$count race',
      zero: 'Geen races',
    );
    return '$_temp0';
  }

  @override
  String get circuitLabel => 'Circuit';

  @override
  String get raceDateUtcLabel => 'Racedatum (UTC)';

  @override
  String get raceStartUtcLabel => 'Start van de race (UTC)';

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
  String get displayRegionLabel => 'Weergaveregio';

  @override
  String displayRegionName(String region) {
    String _temp0 = intl.Intl.selectLogic(region, {
      'raceRegion': 'Regio van het circuit',
      'germany': 'Duits',
      'czechia': 'Tsjechië',
      'english': 'Engels (VK)',
      'other': 'Mijn regio',
    });
    return '$_temp0';
  }

  @override
  String get raceDateLabel => 'Racedatum';

  @override
  String get raceStartLabel => 'Start van de race';

  @override
  String raceTimeWithZone(String time, String zone) {
    return '$time ($zone)';
  }

  @override
  String raceDayTicketPrices(String currency) {
    return 'Ticketprijzen voor de racedag ($currency)';
  }

  @override
  String get sampleTicketPrices =>
      'Voorbeeldprijzen en voorbeeldwisselkoersen.';
}
