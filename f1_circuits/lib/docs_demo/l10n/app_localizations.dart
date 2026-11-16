import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_az.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
    Locale('az'),
    Locale('cs'),
    Locale('de'),
    Locale('es'),
    Locale('fr'),
    Locale('hr'),
    Locale('hu'),
    Locale('it'),
    Locale('ja'),
    Locale('ms'),
    Locale('nl'),
    Locale('pt'),
    Locale('zh'),
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'F1 Circuits 2026'**
  String get title;

  /// Grand Prix name for a race in the 2026 season.
  ///
  /// In en, this message translates to:
  /// **'{raceId, select, australia{Australian Grand Prix} china{Chinese Grand Prix} japan{Japanese Grand Prix} miami{Miami Grand Prix} canada{Canadian Grand Prix} monaco{Monaco Grand Prix} barcelona{Barcelona-Catalunya Grand Prix} austria{Austrian Grand Prix} greatBritain{British Grand Prix} belgium{Belgian Grand Prix} hungary{Hungarian Grand Prix} netherlands{Dutch Grand Prix} italy{Italian Grand Prix} spain{Spanish Grand Prix} azerbaijan{Azerbaijan Grand Prix} bahrain{Bahrain Grand Prix in Malaysia} singapore{Singapore Grand Prix} unitedStates{United States Grand Prix} mexicoCity{Mexico City Grand Prix} saoPaulo{São Paulo Grand Prix} lasVegas{Las Vegas Grand Prix} qatar{Qatar Grand Prix} abuDhabi{Abu Dhabi Grand Prix} other{Unknown race}}'**
  String raceName(String raceId);

  /// Circuit that hosts the given race in the 2026 season.
  ///
  /// In en, this message translates to:
  /// **'{raceId, select, australia{Albert Park Grand Prix Circuit} china{Shanghai International Circuit} japan{Suzuka International Racing Course} miami{Miami International Autodrome} canada{Circuit Gilles-Villeneuve} monaco{Circuit de Monaco} barcelona{Circuit de Barcelona-Catalunya} austria{Red Bull Ring} greatBritain{Silverstone Circuit} belgium{Circuit de Spa-Francorchamps} hungary{Hungaroring} netherlands{Circuit Zandvoort} italy{Autodromo Nazionale Monza} spain{Madring} azerbaijan{Baku City Circuit} bahrain{Sepang International Circuit} singapore{Marina Bay Street Circuit} unitedStates{Circuit of the Americas} mexicoCity{Autódromo Hermanos Rodríguez} saoPaulo{Autódromo José Carlos Pace (Interlagos)} lasVegas{Las Vegas Strip Circuit} qatar{Lusail International Circuit} abuDhabi{Yas Marina Circuit} other{Unknown circuit}}'**
  String circuitName(String raceId);

  /// Heading that includes the name of the circuit.
  ///
  /// In en, this message translates to:
  /// **'Race at {circuitName}'**
  String raceAtCircuit(String circuitName);

  /// Number of ticket categories shown for the race.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No ticket categories} one{{count} ticket category} other{{count} ticket categories}}'**
  String ticketCategoryCount(int count);

  /// Label for a ticket category selected by its identifier.
  ///
  /// In en, this message translates to:
  /// **'{category, select, generalAdmission{General admission} grandstand{Grandstand} vip{VIP} other{Other ticket category}}'**
  String ticketCategory(String category);

  /// Label of a filter for the season's race list.
  ///
  /// In en, this message translates to:
  /// **'{filter, select, past{Past} upcoming{Upcoming} other{All}}'**
  String raceFilter(String filter);

  /// Number of races matching the selected filter.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No races} one{{count} race} other{{count} races}}'**
  String raceResultCount(int count);

  /// No description provided for @circuitLabel.
  ///
  /// In en, this message translates to:
  /// **'Circuit'**
  String get circuitLabel;

  /// No description provided for @raceDateUtcLabel.
  ///
  /// In en, this message translates to:
  /// **'Race date (UTC)'**
  String get raceDateUtcLabel;

  /// No description provided for @raceStartUtcLabel.
  ///
  /// In en, this message translates to:
  /// **'Race start (UTC)'**
  String get raceStartUtcLabel;

  /// Calendar date of the race start in the displayed time zone.
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String raceDateValue(DateTime date);

  /// Time of the race start in the displayed time zone.
  ///
  /// In en, this message translates to:
  /// **'{time}'**
  String raceTimeValue(DateTime time);

  /// No description provided for @displayRegionLabel.
  ///
  /// In en, this message translates to:
  /// **'Display region'**
  String get displayRegionLabel;

  /// Name of a display region in the language of the interface.
  ///
  /// In en, this message translates to:
  /// **'{region, select, raceRegion{Race region} germany{German} czechia{Czechia} english{English (UK)} other{My region}}'**
  String displayRegionName(String region);

  /// No description provided for @raceDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Race date'**
  String get raceDateLabel;

  /// No description provided for @raceStartLabel.
  ///
  /// In en, this message translates to:
  /// **'Race start'**
  String get raceStartLabel;

  /// Already formatted local time followed by its time-zone abbreviation.
  ///
  /// In en, this message translates to:
  /// **'{time} ({zone})'**
  String raceTimeWithZone(String time, String zone);

  /// Heading for race-day ticket prices, including the selected ISO currency code.
  ///
  /// In en, this message translates to:
  /// **'Race-day ticket prices ({currency})'**
  String raceDayTicketPrices(String currency);

  /// No description provided for @sampleTicketPrices.
  ///
  /// In en, this message translates to:
  /// **'Sample prices and exchange rates.'**
  String get sampleTicketPrices;

  /// No description provided for @demoEscapedZone.
  ///
  /// In en, this message translates to:
  /// **'Time zone: \'{UTC}\''**
  String get demoEscapedZone;

  /// No description provided for @demoShortDate.
  ///
  /// In en, this message translates to:
  /// **'{date}'**
  String demoShortDate(DateTime date);

  /// No description provided for @demoFormatUsd.
  ///
  /// In en, this message translates to:
  /// **'{amount}'**
  String demoFormatUsd(num amount);

  /// No description provided for @demoCompactHuf.
  ///
  /// In en, this message translates to:
  /// **'{amount}'**
  String demoCompactHuf(num amount);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'az',
    'cs',
    'de',
    'en',
    'es',
    'fr',
    'hr',
    'hu',
    'it',
    'ja',
    'ms',
    'nl',
    'pt',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'az':
      return AppLocalizationsAz();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ms':
      return AppLocalizationsMs();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
