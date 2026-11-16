import 'package:f1_circuits/display_region.dart';
import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/race_2026.dart';
import 'package:f1_circuits/ticket_pricing.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;
import 'package:material_ui/material_ui.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  tz.initializeTimeZones();
  await initializeDateFormatting();
  runApp(const F1FormatExamplesDemo());
}

class F1FormatExamplesDemo extends StatelessWidget {
  const F1FormatExamplesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('hr'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      home: const _LasVegasExamples(),
    );
  }
}

class _LasVegasExamples extends StatelessWidget {
  const _LasVegasExamples();

  @override
  Widget build(BuildContext context) {
    final messages = AppLocalizations.of(context)!;
    const race = Race2026.lasVegas;
    final startUtc = race.startUtc;
    final venueStart = tz.TZDateTime.from(
      startUtc,
      tz.getLocation(race.timeZone),
    );
    final myRegion = DisplayRegion.myRegion.settings(race);
    final homeStart = tz.TZDateTime.from(
      startUtc,
      tz.getLocation(myRegion.timeZone),
    );
    final timeFormat = DateFormat.Hm(messages.localeName);
    final ticket = race.ticketPrices.eurosFor(TicketCategory.generalAdmission);
    final eurFormat = NumberFormat.simpleCurrency(
      locale: messages.localeName,
      name: TicketCurrency.eur.code,
    );

    return Scaffold(
      appBar: AppBar(title: Text(messages.raceName(race.name))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              title: Text(messages.raceDateUtcLabel),
              subtitle: Text(
                '${messages.demoShortDate(startUtc)}\n'
                '${messages.raceDateValue(startUtc)}',
              ),
            ),
            ListTile(
              title: Text(
                messages.displayRegionName(DisplayRegion.raceRegion.name),
              ),
              subtitle: Text(
                '${messages.raceDateValue(venueStart)} · '
                '${messages.raceTimeWithZone(timeFormat.format(venueStart), venueStart.timeZoneName)}',
              ),
            ),
            ListTile(
              title: Text(
                messages.displayRegionName(DisplayRegion.myRegion.name),
              ),
              subtitle: Text(
                '${messages.raceDateValue(homeStart)} · '
                '${messages.raceTimeWithZone(timeFormat.format(homeStart), homeStart.timeZoneName)}',
              ),
            ),
            Text(messages.demoEscapedZone),
            const Divider(),
            ListTile(
              title: Text(
                messages.ticketCategory(TicketCategory.generalAdmission.name),
              ),
              subtitle: Text(messages.sampleTicketPrices),
            ),
            ListTile(
              title: Text(
                lookupAppLocalizations(const Locale('en'))
                    .demoFormatUsd(ticket * TicketCurrency.usd.unitsPerEuro),
              ),
              subtitle: Text(eurFormat.format(ticket)),
            ),
            ListTile(
              title: Text(
                messages.demoCompactHuf(
                  ticket * TicketCurrency.huf.unitsPerEuro,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
