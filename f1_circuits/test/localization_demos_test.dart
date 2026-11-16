import 'package:f1_circuits/docs_demo/advanced_localization_demo.dart';
import 'package:f1_circuits/docs_demo/format_examples_demo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:material_ui/material_ui.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() {
  setUpAll(() async {
    tz.initializeTimeZones();
    await initializeDateFormatting();
  });

  testWidgets('shows the Las Vegas formatting and escaping examples', (
    tester,
  ) async {
    await tester.pumpWidget(const F1FormatExamplesDemo());
    await tester.pumpAndSettle();

    expect(find.text('Vremenska zona: {UTC}'), findsOneWidget);
    expect(find.textContaining('22. 11. 2026.'), findsOneWidget);
    expect(find.textContaining('22. studenoga 2026.'), findsWidgets);
    expect(find.textContaining('20:00 (PST)'), findsOneWidget);
    expect(find.textContaining('05:00 (CET)'), findsOneWidget);
    expect(find.text(r'$165.00'), findsOneWidget);
    expect(find.textContaining('HUF'), findsOneWidget);
  });

  testWidgets('loads the manual, intl and custom Material resources', (
    tester,
  ) async {
    await tester.pumpWidget(const F1AdvancedLocalizationDemo());
    await tester.pumpAndSettle();

    expect(find.text('Velika nagrada Las Vegasa'), findsNWidgets(2));
    expect(find.text('Attende · Meir'), findsOneWidget);

    await tester.tap(find.byType(DropdownButton<Locale>));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('zh-Hant-MO').last);
    await tester.tap(find.text('zh-Hant-MO').last);
    await tester.pumpAndSettle();

    expect(find.text('zh-Hant-MO → zh-Hant-HK'), findsOneWidget);
    expect(find.text('拉斯維加斯格蘭披治大賽'), findsOneWidget);
    expect(find.text('Velika nagrada Las Vegasa'), findsOneWidget);
    expect(find.text('Attende · Meir'), findsOneWidget);
  });
}
