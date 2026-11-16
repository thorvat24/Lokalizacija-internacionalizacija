import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/race_2026.dart';
import 'package:material_ui/material_ui.dart';

void main() => runApp(const F1CalendarDemo());

class F1CalendarDemo extends StatelessWidget {
  const F1CalendarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      home: Builder(
        builder: (appContext) {
          final messages = AppLocalizations.of(appContext)!;
          const ticketCategories = ['generalAdmission', 'grandstand', 'vip'];
          final raceDay = DateTime(2026, 11, 21);
          final startUtc = Race2026.lasVegas.startUtc;

          Widget raceCalendar() {
            return CalendarDatePicker(
              initialDate: raceDay,
              firstDate: DateTime(2026, 11, 1),
              lastDate: DateTime(2026, 11, 30),
              onDateChanged: (_) {},
            );
          }

          return Scaffold(
            appBar: AppBar(title: Text(messages.title)),
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Text(Localizations.localeOf(appContext).toLanguageTag()),
                  raceCalendar(),
                  const Divider(),
                  Localizations.override(
                    context: appContext,
                    locale: const Locale('ja', 'JP'),
                    child: Builder(
                      builder: (calendarContext) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Localizations.localeOf(calendarContext)
                                  .toLanguageTag(),
                            ),
                            raceCalendar(),
                          ],
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Text(
                    messages.raceAtCircuit(
                      messages.circuitName(Race2026.lasVegas.name),
                    ),
                  ),
                  Text(messages.ticketCategoryCount(ticketCategories.length)),
                  for (final category in ticketCategories)
                    Text(messages.ticketCategory(category)),
                  ListTile(
                    title: Text(messages.raceDateUtcLabel),
                    subtitle: Text(messages.raceDateValue(startUtc)),
                  ),
                  ListTile(
                    title: Text(messages.raceStartUtcLabel),
                    subtitle: Text(messages.raceTimeValue(startUtc)),
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
