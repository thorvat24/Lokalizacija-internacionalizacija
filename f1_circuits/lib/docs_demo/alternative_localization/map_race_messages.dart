import 'package:f1_circuits/docs_demo/alternative_localization/manual_demo_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// A small translation catalog loaded without intl or code generation.
class MapRaceMessages {
  const MapRaceMessages(this.locale);

  final Locale locale;

  static MapRaceMessages of(BuildContext context) =>
      Localizations.of<MapRaceMessages>(context, MapRaceMessages)!;

  static const delegate = _MapRaceMessagesDelegate();

  String get raceTitle {
    final catalogs = ManualDemoStrings.localeTitles;
    final catalog =
        catalogs[locale.toLanguageTag()] ??
        catalogs[locale.languageCode] ??
        catalogs['en']!;
    return catalog['raceTitle']!;
  }
}

class _MapRaceMessagesDelegate extends LocalizationsDelegate<MapRaceMessages> {
  const _MapRaceMessagesDelegate();

  @override
  bool isSupported(Locale locale) =>
      ManualDemoStrings.localeTitles.containsKey(locale.languageCode);

  @override
  Future<MapRaceMessages> load(Locale locale) =>
      SynchronousFuture(MapRaceMessages(locale));

  @override
  bool shouldReload(_MapRaceMessagesDelegate old) => false;
}
