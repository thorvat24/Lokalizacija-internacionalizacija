import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const F1CalendarDemo());

class F1CalendarDemo extends StatelessWidget {
  const F1CalendarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
        Locale('ja', 'JP'),
      ],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: Builder(
        builder: (appContext) {
          final raceDay = DateTime(2026, 11, 21);

          Widget raceCalendar() {
            return CalendarDatePicker(
              initialDate: raceDay,
              firstDate: DateTime(2026, 11, 1),
              lastDate: DateTime(2026, 11, 30),
              onDateChanged: (_) {},
            );
          }

          return Scaffold(
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
