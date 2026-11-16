import 'package:f1_circuits/docs_demo/alternative_localization/intl_race_messages.dart';
import 'package:f1_circuits/docs_demo/alternative_localization/manual_demo_strings.dart';
import 'package:f1_circuits/docs_demo/alternative_localization/map_race_messages.dart';
import 'package:f1_circuits/docs_demo/alternative_localization/nynorsk_material_demo.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:material_ui/material_ui.dart';

Future<void> main() async {
  await initializeDateFormatting();
  runApp(const F1AdvancedLocalizationDemo());
}

const _hongKong = Locale.fromSubtags(
  languageCode: 'zh',
  scriptCode: 'Hant',
  countryCode: 'HK',
);
const _macao = Locale.fromSubtags(
  languageCode: 'zh',
  scriptCode: 'Hant',
  countryCode: 'MO',
);
const _supportedLocales = [
  Locale('en'),
  Locale('hr'),
  Locale('zh'),
  Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
  Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
  Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
  _hongKong,
];

class F1AdvancedLocalizationDemo extends StatefulWidget {
  const F1AdvancedLocalizationDemo({super.key});

  @override
  State<F1AdvancedLocalizationDemo> createState() =>
      _F1AdvancedLocalizationDemoState();
}

class _F1AdvancedLocalizationDemoState
    extends State<F1AdvancedLocalizationDemo> {
  Locale _preferred = const Locale('hr');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _preferred,
      supportedLocales: _supportedLocales,
      localeResolutionCallback: (preferred, supported) {
        if (preferred == _macao) return _hongKong;
        return basicLocaleListResolution(
          preferred == null ? null : [preferred],
          supported,
        );
      },
      localizationsDelegates: const [
        MapRaceMessages.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      home: Builder(
        builder: (context) {
          final actual = Localizations.localeOf(context);
          final mapTitle = MapRaceMessages.of(context).raceTitle;

          return Scaffold(
            appBar: AppBar(title: Text(mapTitle)),
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  DropdownButton<Locale>(
                    value: _preferred,
                    isExpanded: true,
                    items: [
                      for (final locale in [..._supportedLocales, _macao])
                        DropdownMenuItem(
                          value: locale,
                          child: Text(locale.toLanguageTag()),
                        ),
                    ],
                    onChanged: (locale) {
                      if (locale != null) setState(() => _preferred = locale);
                    },
                  ),
                  ListTile(
                    title: const Text(ManualDemoStrings.mapExample),
                    subtitle: Text(
                      '${_preferred.toLanguageTag()} → ${actual.toLanguageTag()}',
                    ),
                  ),
                  Localizations.override(
                    context: context,
                    locale: const Locale('hr'),
                    delegates: const [IntlRaceMessages.delegate],
                    child: Builder(
                      builder: (context) => ListTile(
                        title: const Text(ManualDemoStrings.intlExample),
                        subtitle: Text(
                          IntlRaceMessages.of(context).lasVegasTitle,
                        ),
                      ),
                    ),
                  ),
                  Localizations.override(
                    context: context,
                    locale: const Locale('nn'),
                    delegates: const [
                      DemoNynorskMaterialLocalizations.delegate,
                    ],
                    child: Builder(
                      builder: (context) {
                        final material = MaterialLocalizations.of(context);
                        return ListTile(
                          title: const Text(ManualDemoStrings.materialExample),
                          subtitle: Text(
                            '${material.backButtonTooltip} · ${material.moreButtonTooltip}',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
