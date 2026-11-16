import 'package:f1_circuits/docs_demo/alternative_localization/manual_demo_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;
import 'package:material_ui/material_ui.dart';

/// Demonstrates two Nynorsk overrides. Other Material resources use Bokmål.
class DemoNynorskMaterialLocalizations extends MaterialLocalizationNb {
  const DemoNynorskMaterialLocalizations({
    required super.fullYearFormat,
    required super.compactDateFormat,
    required super.shortDateFormat,
    required super.mediumDateFormat,
    required super.longDateFormat,
    required super.yearMonthFormat,
    required super.shortMonthDayFormat,
    required super.decimalFormat,
    required super.twoDigitZeroPaddedFormat,
  });

  static const delegate = _NynorskMaterialDelegate();

  @override
  String get backButtonTooltip => ManualDemoStrings.nynorskBack;

  @override
  String get moreButtonTooltip => ManualDemoStrings.nynorskMore;
}

class _NynorskMaterialDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _NynorskMaterialDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'nn';

  @override
  Future<MaterialLocalizations> load(Locale locale) => SynchronousFuture(
    DemoNynorskMaterialLocalizations(
      fullYearFormat: DateFormat.y('nb'),
      compactDateFormat: DateFormat.yMd('nb'),
      shortDateFormat: DateFormat.yMMMd('nb'),
      mediumDateFormat: DateFormat.MMMEd('nb'),
      longDateFormat: DateFormat.yMMMMEEEEd('nb'),
      yearMonthFormat: DateFormat.yMMMM('nb'),
      shortMonthDayFormat: DateFormat.MMMd('nb'),
      decimalFormat: NumberFormat.decimalPattern('nb'),
      twoDigitZeroPaddedFormat: NumberFormat('00', 'nb'),
    ),
  );

  @override
  bool shouldReload(_NynorskMaterialDelegate old) => false;
}
