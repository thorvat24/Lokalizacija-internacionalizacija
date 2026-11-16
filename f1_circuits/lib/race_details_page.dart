import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/race_2026.dart';
import 'package:material_ui/material_ui.dart';

class RaceDetailsPage extends StatelessWidget {
  const RaceDetailsPage({super.key, required this.race});

  final Race2026 race;

  @override
  Widget build(BuildContext context) {
    final messages = AppLocalizations.of(context)!;
    final startUtc = race.startUtc;

    return Scaffold(
      appBar: AppBar(title: Text(messages.raceName(race.name))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              leading: const Icon(Icons.place_outlined),
              title: Text(messages.circuitLabel),
              subtitle: Text(messages.circuitName(race.name)),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined),
              title: Text(messages.raceDateUtcLabel),
              subtitle: Text(messages.raceDateValue(startUtc)),
            ),
            ListTile(
              leading: const Icon(Icons.schedule_outlined),
              title: Text(messages.raceStartUtcLabel),
              subtitle: Text(messages.raceTimeValue(startUtc)),
            ),
          ],
        ),
      ),
    );
  }
}
