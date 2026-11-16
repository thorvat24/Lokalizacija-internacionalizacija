import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/docs_demo/calendar_demo.dart';
import 'package:f1_circuits/main.dart';
import 'package:f1_circuits/race_2026.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('shows the 2026 rounds and circuits in official calendar order', (
    tester,
  ) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.localesTestValue = const [Locale('en')];
    addTearDown(dispatcher.clearLocalesTestValue);

    await tester.pumpWidget(const F1CircuitsApp());
    await tester.pumpAndSettle();

    expect(find.text('Australian Grand Prix'), findsOneWidget);
    expect(find.text('Albert Park Grand Prix Circuit'), findsOneWidget);
    expect(Race2026.values, hasLength(23));

    for (final title in [
      'Bahrain Grand Prix in Malaysia',
      'Las Vegas Grand Prix',
      'Qatar Grand Prix',
      'Abu Dhabi Grand Prix',
    ]) {
      final race = find.text(title);
      await tester.scrollUntilVisible(race, 250);
      expect(race, findsOneWidget);
    }
    expect(find.text('Yas Marina Circuit'), findsOneWidget);
  });

  testWidgets('localizes race names on a Croatian device', (tester) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.localesTestValue = const [Locale('hr', 'HR')];
    addTearDown(dispatcher.clearLocalesTestValue);

    await tester.pumpWidget(const F1CircuitsApp());
    await tester.pumpAndSettle();

    expect(find.text('F1 staze 2026'), findsOneWidget);
    expect(find.text('Velika nagrada Australije'), findsOneWidget);
    expect(find.text('Albert Park Grand Prix Circuit'), findsOneWidget);
  });

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

    final messages = AppLocalizations.of(englishCalendar)!;
    expect(
      messages.raceAtCircuit(messages.circuitName(Race2026.lasVegas.name)),
      'Race at Las Vegas Strip Circuit',
    );
    expect(messages.ticketCategoryCount(1), '1 ticket category');
    expect(messages.ticketCategoryCount(3), '3 ticket categories');
    expect(messages.ticketCategory('generalAdmission'), 'General admission');
    expect(messages.ticketCategory('grandstand'), 'Grandstand');
    expect(messages.ticketCategory('vip'), 'VIP');

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

    final categoryCount = find.text('3 kategorije ulaznica');
    await tester.scrollUntilVisible(
      categoryCount,
      250,
      scrollable: find.descendant(
        of: find.byType(ListView),
        matching: find.byType(Scrollable).first,
      ),
    );
    expect(find.text('Utrka na stazi Las Vegas Strip Circuit'), findsOneWidget);
    expect(find.text('Opći ulaz'), findsOneWidget);
    expect(find.text('Tribina'), findsOneWidget);
    expect(find.text('VIP'), findsOneWidget);

    final messages = AppLocalizations.of(tester.element(categoryCount))!;
    expect(messages.ticketCategoryCount(0), 'Nema kategorija ulaznica');
    expect(messages.ticketCategoryCount(1), '1 kategorija ulaznica');
    expect(messages.ticketCategoryCount(5), '5 kategorija ulaznica');
    expect(messages.ticketCategory('unknown'), 'Druga kategorija ulaznica');
  });
}
