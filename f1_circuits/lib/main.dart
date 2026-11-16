import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/race_2026.dart';
import 'package:material_ui/material_ui.dart';

void main() => runApp(const F1CircuitsApp());

class F1CircuitsApp extends StatelessWidget {
  const F1CircuitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      home: const RaceListPage(),
    );
  }
}

class RaceListPage extends StatelessWidget {
  const RaceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(messages.title)),
      body: SafeArea(
        child: ListView.separated(
          itemCount: Race2026.values.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final race = Race2026.values[index];

            return ListTile(
              title: Text(messages.raceName(race.name)),
              subtitle: Text(messages.circuitName(race.name)),
            );
          },
        ),
      ),
    );
  }
}
