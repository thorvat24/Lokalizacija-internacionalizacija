import 'package:f1_circuits/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('uses English as a fallback and localizes the second calendar', (
    tester,
  ) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.localesTestValue = const [Locale('de', 'DE')];
    addTearDown(dispatcher.clearLocalesTestValue);

    await tester.pumpWidget(const F1CalendarDemo());
    await tester.pumpAndSettle();

    expect(find.text('F1 Circuits 2026'), findsOneWidget);

    final calendars = find.byType(CalendarDatePicker);
    expect(calendars, findsNWidgets(2));
    final englishCalendar = tester.element(calendars.at(0));
    final japaneseCalendar = tester.element(calendars.at(1));
    expect(Localizations.localeOf(englishCalendar), const Locale('en'));
    expect(Localizations.localeOf(japaneseCalendar), const Locale('ja', 'JP'));

    final raceDay = DateTime(2026, 11, 21);
    expect(
      MaterialLocalizations.of(englishCalendar).formatMonthYear(raceDay),
      isNot(
        MaterialLocalizations.of(japaneseCalendar).formatMonthYear(raceDay),
      ),
    );
  });

  testWidgets('uses Croatian app strings on a Croatian device', (tester) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.localesTestValue = const [Locale('hr', 'HR')];
    addTearDown(dispatcher.clearLocalesTestValue);

    await tester.pumpWidget(const F1CalendarDemo());
    await tester.pumpAndSettle();

    expect(find.text('F1 staze 2026'), findsOneWidget);
  });
}
