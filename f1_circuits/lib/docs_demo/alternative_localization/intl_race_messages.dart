import 'package:f1_circuits/docs_demo/alternative_localization/catalog/messages_all.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' show Intl;

class IntlRaceMessages {
  const IntlRaceMessages(this.localeName);

  final String localeName;

  static const delegate = _IntlRaceMessagesDelegate();

  static IntlRaceMessages of(BuildContext context) =>
      Localizations.of<IntlRaceMessages>(context, IntlRaceMessages)!;

  String get lasVegasTitle => Intl.message(
    'Las Vegas Grand Prix',
    name: 'lasVegasTitle',
    desc: 'Race name in the Intl.message example.',
    locale: localeName,
  );
}

class _IntlRaceMessagesDelegate
    extends LocalizationsDelegate<IntlRaceMessages> {
  const _IntlRaceMessagesDelegate();

  @override
  bool isSupported(Locale locale) =>
      const ['en', 'hr'].contains(locale.languageCode);

  @override
  Future<IntlRaceMessages> load(Locale locale) async {
    final localeName = Intl.canonicalizedLocale(locale.languageCode);
    await initializeMessages(localeName);
    return IntlRaceMessages(localeName);
  }

  @override
  bool shouldReload(_IntlRaceMessagesDelegate old) => false;
}
