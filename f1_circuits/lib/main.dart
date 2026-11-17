import 'package:f1_circuits/display_region.dart';
import 'package:f1_circuits/display_region_picker.dart';
import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/race_2026.dart';
import 'package:f1_circuits/race_artwork.dart';
import 'package:f1_circuits/race_details_page.dart';
import 'package:f1_circuits/race_theme.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:material_ui/material_ui.dart';
import 'package:timezone/data/latest_all.dart' as tz;

Future<void> main() async {
  tz.initializeTimeZones();
  await initializeDateFormatting();
  runApp(const F1CircuitsApp());
}

class F1CircuitsApp extends StatefulWidget {
  const F1CircuitsApp({super.key, this.now = DateTime.now});

  final DateTime Function() now;

  @override
  State<F1CircuitsApp> createState() => _F1CircuitsAppState();
}

class _F1CircuitsAppState extends State<F1CircuitsApp> {
  final _theme = buildRaceTheme();
  DisplayRegion _region = DisplayRegion.myRegion;

  void _changeRegion(DisplayRegion region) => setState(() => _region = region);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      locale: _region.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      home: RaceListPage(
        now: widget.now,
        region: _region,
        onRegionChanged: _changeRegion,
      ),
    );
  }
}

enum _RaceFilter { all, past, upcoming }

class RaceListPage extends StatefulWidget {
  const RaceListPage({
    super.key,
    required this.now,
    required this.region,
    required this.onRegionChanged,
  });

  final DateTime Function() now;
  final DisplayRegion region;
  final ValueChanged<DisplayRegion> onRegionChanged;

  @override
  State<RaceListPage> createState() => _RaceListPageState();
}

class _RaceListPageState extends State<RaceListPage> {
  _RaceFilter _filter = _RaceFilter.all;

  @override
  Widget build(BuildContext context) {
    final messages = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final now = widget.now();
    final races = Race2026.values.where((race) {
      return switch (_filter) {
        _RaceFilter.all => true,
        _RaceFilter.past => !race.startUtc.isAfter(now),
        _RaceFilter.upcoming => race.startUtc.isAfter(now),
      };
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                messages.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: DisplayRegionPicker(
                    value: widget.region,
                    onChanged: widget.onRegionChanged,
                  ),
                ),
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
                    child: Text(
                      messages.raceResultCount(races.length),
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    key: ValueKey(_filter),
                    itemCount: races.length,
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final race = races[index];

                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          horizontalTitleGap: 12,
                          leading: CircuitArtwork.thumbnail(race: race),
                          title: Text(
                            messages.raceName(race.name),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            messages.circuitName(race.name),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              HostFlag(race: race),
                              const SizedBox(width: 4),
                              const Icon(Icons.chevron_right, size: 20),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (context) => RaceDetailsPage(
                                  race: race,
                                  initialRegion: widget.region,
                                  onSharedRegionChanged: widget.onRegionChanged,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
