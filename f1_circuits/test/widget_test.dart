import 'package:f1_circuits/display_region.dart';
import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/docs_demo/calendar_demo.dart';
import 'package:f1_circuits/main.dart';
import 'package:f1_circuits/race_2026.dart';
import 'package:f1_circuits/ticket_pricing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show DateFormat, Intl, NumberFormat;
import 'package:material_ui/material_ui.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  setUpAll(() async {
    tz.initializeTimeZones();
    await initializeDateFormatting();
  });

  testWidgets('translates Las Vegas details and converts its start time', (
    tester,
  ) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.localesTestValue = const [Locale('en', 'GB')];
    addTearDown(dispatcher.clearLocalesTestValue);

    await tester.pumpWidget(
      F1CircuitsApp(now: () => DateTime.utc(2026, 11, 16)),
    );
    await tester.pumpAndSettle();

    final menu = find.byType(DropdownButton<DisplayRegion>);
    final listPicker = tester.widget<DropdownButton<DisplayRegion>>(menu);
    expect(listPicker.value, DisplayRegion.myRegion);
    expect(listPicker.items!.map((item) => item.value), [
      DisplayRegion.myRegion,
      DisplayRegion.czechia,
      DisplayRegion.english,
      DisplayRegion.germany,
    ]);

    await tester.tap(find.text('Nadolazeće'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Velika nagrada Las Vegasa'));
    await tester.pumpAndSettle();

    expect(find.text('22. studenoga 2026.'), findsOne);
    expect(find.text('05:00 (CET)'), findsOne);

    final detailPicker = tester.widget<DropdownButton<DisplayRegion>>(menu);
    expect(detailPicker.items!.map((item) => item.value), [
      DisplayRegion.myRegion,
      DisplayRegion.raceRegion,
      DisplayRegion.czechia,
      DisplayRegion.english,
      DisplayRegion.germany,
    ]);

    await tester.tap(menu);
    await tester.pumpAndSettle();
    expect(find.text('Njemački'), findsWidgets);
    expect(find.text('Češka'), findsWidgets);
    expect(find.text('Engleski (UK)'), findsWidgets);
    await tester.tap(find.text('Regija utrke').last);
    await tester.pumpAndSettle();

    expect(find.text('Race start'), findsOne);
    expect(find.text('November 21, 2026'), findsOne);
    expect(find.textContaining(RegExp(r'^8:00\s+PM \(PST\)$')), findsOne);

    await tester.tap(menu);
    await tester.pumpAndSettle();
    await tester.tap(find.text('German').last);
    await tester.pumpAndSettle();
    expect(find.text('22. November 2026'), findsOne);
    expect(find.text('05:00 (CET)'), findsOne);
    expect(find.text('Großer Preis von Las Vegas'), findsOne);
    expect(find.text('Deutsch'), findsOne);
    expect(find.text('Anzeigeregion'), findsOne);
    expect(find.text('Rennstrecke'), findsOne);
    expect(find.text('Rennstart'), findsOne);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(
      tester.widget<DropdownButton<DisplayRegion>>(menu).value,
      DisplayRegion.germany,
    );
    expect(find.text('3 Rennen'), findsOne);
    expect(find.text('Bevorstehende'), findsOne);
  });

  testWidgets('applies the race language and restores Croatian on return', (
    tester,
  ) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.localesTestValue = const [Locale('hr', 'HR')];
    addTearDown(dispatcher.clearLocalesTestValue);

    await tester.pumpWidget(
      F1CircuitsApp(now: () => DateTime.utc(2026, 11, 16)),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Nadolazeće'));
    await tester.pumpAndSettle();

    final menu = find.byType(DropdownButton<DisplayRegion>);
    for (final (title, locale, date, hour) in [
      ('Velika nagrada Katara', 'ar_QA', DateTime.utc(2026, 11, 29), 19),
      ('Velika nagrada Abu Dhabija', 'ar_AE', DateTime.utc(2026, 12, 6), 17),
    ]) {
      await tester.tap(find.text(title));
      await tester.pumpAndSettle();
      expect(
        tester.widget<DropdownButton<DisplayRegion>>(menu).value,
        DisplayRegion.myRegion,
      );
      await tester.tap(menu);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Regija utrke').last);
      await tester.pumpAndSettle();

      final wallTime = date.add(Duration(hours: hour));
      final localStartLabel = find.text('موعد انطلاق السباق');
      expect(localStartLabel, findsOne);
      expect(
        Directionality.of(tester.element(localStartLabel)),
        TextDirection.rtl,
      );
      expect(find.text('منطقة الحلبة'), findsOne);
      expect(find.text(DateFormat.yMMMMd(locale).format(wallTime)), findsOne);
      expect(
        find.textContaining(DateFormat.jm(locale).format(wallTime)),
        findsOne,
      );

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(find.text('Nadolazeće'), findsOne);
    }
  });

  testWidgets('offers Czech, English and German before returning to Croatian', (
    tester,
  ) async {
    final dispatcher = tester.binding.platformDispatcher;
    dispatcher.localesTestValue = const [Locale('en', 'US')];
    addTearDown(dispatcher.clearLocalesTestValue);

    await tester.pumpWidget(const F1CircuitsApp());
    await tester.pumpAndSettle();
    final menu = find.byType(DropdownButton<DisplayRegion>);

    expect(find.text('Moja regija'), findsOne);
    expect(find.text('F1 staze 2026'), findsOne);

    for (final (choice, heading, race, filter) in [
      ('Češka', 'Okruhy F1 2026', 'Velká cena Austrálie', 'Nadcházející'),
      (
        'Angličtina (Spojené království)',
        'F1 Circuits 2026',
        'Australian Grand Prix',
        'Upcoming',
      ),
      (
        'German',
        'F1-Rennstrecken 2026',
        'Großer Preis von Australien',
        'Bevorstehende',
      ),
      (
        'Meine Region',
        'F1 staze 2026',
        'Velika nagrada Australije',
        'Nadolazeće',
      ),
    ]) {
      await tester.tap(menu);
      await tester.pumpAndSettle();
      await tester.tap(find.text(choice).last);
      await tester.pumpAndSettle();

      expect(find.text(heading), findsOne);
      expect(find.text(race), findsOne);
      expect(find.text(filter), findsOne);
    }
  });

  testWidgets('converts all three race-day prices when the region changes', (
    tester,
  ) async {
    await tester.pumpWidget(
      F1CircuitsApp(now: () => DateTime.utc(2026, 11, 17)),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Nadolazeće'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Velika nagrada Las Vegasa'));
    await tester.pumpAndSettle();

    expect(find.text('Cijene ulaznica za dan utrke (EUR)'), findsOne);
    expect(find.text('Ogledne cijene i tečajevi.'), findsOne);
    expect(find.text('Opći ulaz'), findsOne);
    expect(find.text('Tribina'), findsOne);
    expect(find.text('VIP'), findsOne);

    final menu = find.byType(DropdownButton<DisplayRegion>);
    for (final (choice, locale, currency, heading, amounts) in [
      (
        'Češka',
        'cs_CZ',
        'CZK',
        'Ceny vstupenek na den závodu (CZK)',
        [3750, 8000, 23750],
      ),
      (
        'Angličtina (Spojené království)',
        'en_GB',
        'GBP',
        'Race-day ticket prices (GBP)',
        [127.5, 272, 807.5],
      ),
      (
        'Race region',
        'en_US',
        'USD',
        'Race-day ticket prices (USD)',
        [165, 352, 1045],
      ),
    ]) {
      await tester.tap(menu);
      await tester.pumpAndSettle();
      await tester.tap(find.text(choice).last);
      await tester.pumpAndSettle();

      expect(find.text(heading), findsOne);
      final format = NumberFormat.simpleCurrency(
        locale: locale,
        name: currency,
      );
      for (final amount in amounts) {
        expect(find.text(format.format(amount)), findsOne);
      }
    }
  });

  test('all race regions resolve dates and ticket prices', () {
    for (final race in Race2026.values) {
      final start = tz.TZDateTime.from(
        race.startUtc,
        tz.getLocation(race.timeZone),
      );
      expect(start.isAtSameMomentAs(race.startUtc), isTrue, reason: race.name);
      expect(DateFormat.yMMMMd(race.locale).format(start), isNotEmpty);
      final locale = Intl.verifiedLocale(race.locale, DateFormat.localeExists);
      final currency = NumberFormat.simpleCurrency(
        locale: locale,
        name: race.currency.code,
      );
      final prices = [
        for (final category in TicketCategory.values)
          race.ticketPrices.eurosFor(category) * race.currency.unitsPerEuro,
      ];
      expect(prices, orderedEquals(prices.toList()..sort()), reason: race.name);
      expect(prices.toSet(), hasLength(3), reason: race.name);
      expect(prices.first, greaterThan(0), reason: race.name);
      expect(prices.map(currency.format).toSet(), hasLength(3));
      expect(
        AppLocalizations.delegate.isSupported(race.interfaceLocale),
        isTrue,
      );
      expect(
        GlobalMaterialLocalizations.delegate.isSupported(race.interfaceLocale),
        isTrue,
      );
    }
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

    await tester.tap(find.byType(DropdownButton<DisplayRegion>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Engleski (UK)').last);
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
    dispatcher.localesTestValue = const [Locale('sv', 'SE')];
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
