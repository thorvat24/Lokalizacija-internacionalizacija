import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/docs_demo/calendar_demo.dart';
import 'package:f1_circuits/main.dart';
import 'package:f1_circuits/race_2026.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('opens race details and formats the Las Vegas start in UTC', (
    tester,
  ) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.localesTestValue = const [Locale('en')];
    addTearDown(dispatcher.clearLocalesTestValue);

    await tester.pumpWidget(
      F1CircuitsApp(now: () => DateTime.utc(2026, 11, 16)),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Upcoming'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Las Vegas Grand Prix'));
    await tester.pumpAndSettle();

    expect(find.text('Las Vegas Strip Circuit'), findsOneWidget);
    expect(find.text('Race date (UTC)'), findsOneWidget);
    expect(find.text('November 22, 2026'), findsOneWidget);
    expect(find.text('Race start (UTC)'), findsOneWidget);
    expect(find.textContaining(RegExp(r'^4:00\s+AM$')), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('3 races'), findsOneWidget);
  });

  testWidgets('formats Croatian race date and time in details', (tester) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.localesTestValue = const [Locale('hr', 'HR')];
    addTearDown(dispatcher.clearLocalesTestValue);

    await tester.pumpWidget(const F1CircuitsApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Velika nagrada Australije'));
    await tester.pumpAndSettle();

    expect(find.text('Staza'), findsOneWidget);
    expect(find.text('Datum utrke (UTC)'), findsOneWidget);
    expect(find.text('8. ožujka 2026.'), findsOneWidget);
    expect(find.text('Početak utrke (UTC)'), findsOneWidget);
    expect(find.text('04:00'), findsOneWidget);
  });

  testWidgets('filters races by start and updates the Croatian count', (
    tester,
  ) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.localesTestValue = const [Locale('hr', 'HR')];
    addTearDown(dispatcher.clearLocalesTestValue);
    var now = DateTime.utc(2026, 11, 16);

    await tester.pumpWidget(F1CircuitsApp(now: () => now));
    await tester.pumpAndSettle();

    expect(find.text('23 utrke'), findsOneWidget);
    await tester.tap(find.text('Nadolazeće'));
    await tester.pumpAndSettle();
    expect(find.byType(ListTile), findsNWidgets(3));
    expect(find.text('Velika nagrada Las Vegasa'), findsOneWidget);
    expect(find.text('3 utrke'), findsOneWidget);

    await tester.tap(find.text('Prošle'));
    await tester.pumpAndSettle();
    expect(find.text('20 utrka'), findsOneWidget);
    expect(find.text('Velika nagrada Australije'), findsOneWidget);

    now = Race2026.lasVegas.startUtc;
    await tester.tap(find.text('Nadolazeće'));
    await tester.pumpAndSettle();
    expect(find.text('2 utrke'), findsOneWidget);
    expect(find.text('Velika nagrada Las Vegasa'), findsNothing);

    await tester.tap(find.text('Sve'));
    await tester.pumpAndSettle();
    expect(find.text('23 utrke'), findsOneWidget);
  });

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
