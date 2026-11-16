# Flutter primjeri lokalizacije

Pokreni naredbe iz korijena Flutter projekta.

| Naredba | Što pokazuje |
| --- | --- |
| `flutter run -t lib/docs_demo/calendar_demo.dart` | Prijevode iz ARB-a, `Localizations.override`, placeholder, množinu i `select`. |
| `flutter run -t lib/docs_demo/format_examples_demo.dart` | Las Vegas u dvije vremenske zone, dva formata istog UTC datuma, doslovni `{UTC}` i formate oglednih iznosa u EUR, USD i HUF. |
| `flutter run -t lib/docs_demo/advanced_localization_demo.dart` | `Locale.fromSubtags`, odabir podržanog localea, učitavanje prijevoda iz mape i generiranog `intl` kataloga te vlastiti Material delegat. |

U naprednom primjeru izaberi `zh-Hant-MO`. Primjer pravila u `localeResolutionCallback` preusmjerava ga na podržani `zh-Hant-HK`. Kartica `Intl.message` učitava hrvatski katalog u svom dijelu ekrana. Material delegat demonstrira dva Nynorsk prijevoda (`Attende` i `Meir`). Za ostale Material prijevode i formate koristi Bokmål.

## Generiranje prijevoda

`flutter gen-l10n` generira `AppLocalizations` iz aplikacijskih ARB datoteka prema `l10n.yaml`. Uključeni `use-escaping` omogućuje doslovne zagrade u poruci `demoEscapedZone`.

Alternativni `Intl.message` katalog generira se u dva koraka. Nakon prvog koraka predložak `intl_messages.arb` služi kao osnova za engleski i hrvatski prijevod.

```text
dart run intl_translation:extract_to_arb --output-dir=lib/docs_demo/alternative_localization/catalog lib/docs_demo/alternative_localization/intl_race_messages.dart
dart run intl_translation:generate_from_arb --output-dir=lib/docs_demo/alternative_localization/catalog --no-use-deferred-loading lib/docs_demo/alternative_localization/intl_race_messages.dart lib/docs_demo/alternative_localization/catalog/intl_en.arb lib/docs_demo/alternative_localization/catalog/intl_hr.arb
```

## iOS

Podržani jezici aplikacije navedeni su u `CFBundleLocalizations` u `ios/Runner/Info.plist` te u `knownRegions` u projektu Runner.

## Izvori

- [Flutter – Internationalizing Flutter apps](https://docs.flutter.dev/ui/internationalization)
- [Dart – intl_translation](https://pub.dev/packages/intl_translation)
- [Apple – CFBundleLocalizations](https://developer.apple.com/documentation/bundleresources/information-property-list/cfbundlelocalizations)
