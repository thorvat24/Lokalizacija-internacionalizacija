import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/race_2026.dart';
import 'package:f1_circuits/race_details_page.dart';
import 'package:material_ui/material_ui.dart';

void main() => runApp(const F1CircuitsApp());

class F1CircuitsApp extends StatelessWidget {
  const F1CircuitsApp({super.key, this.now = DateTime.now});

  final DateTime Function() now;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      home: RaceListPage(now: now),
    );
  }
}

enum _RaceFilter { all, past, upcoming }

class RaceListPage extends StatefulWidget {
  const RaceListPage({super.key, this.now = DateTime.now});

  final DateTime Function() now;

  @override
  State<RaceListPage> createState() => _RaceListPageState();
}

class _RaceListPageState extends State<RaceListPage> {
  _RaceFilter _filter = _RaceFilter.all;

  @override
  Widget build(BuildContext context) {
    final messages = AppLocalizations.of(context)!;
    final now = widget.now();
    final races = Race2026.values.where((race) {
      return switch (_filter) {
        _RaceFilter.all => true,
        _RaceFilter.past => !race.startUtc.isAfter(now),
        _RaceFilter.upcoming => race.startUtc.isAfter(now),
      };
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(messages.title)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  for (final filter in _RaceFilter.values)
                    ChoiceChip(
                      label: Text(messages.raceFilter(filter.name)),
                      selected: _filter == filter,
                      onSelected: (selected) {
                        if (selected) setState(() => _filter = filter);
                      },
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Semantics(
                liveRegion: true,
                child: Text(messages.raceResultCount(races.length)),
              ),
            ),
            Expanded(
              child: ListView.separated(
                key: ValueKey(_filter),
                itemCount: races.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final race = races[index];

                  return ListTile(
                    title: Text(messages.raceName(race.name)),
                    subtitle: Text(messages.circuitName(race.name)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => RaceDetailsPage(race: race),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
