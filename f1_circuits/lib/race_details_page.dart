import 'package:f1_circuits/display_region.dart';
import 'package:f1_circuits/display_region_picker.dart';
import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:f1_circuits/race_2026.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:timezone/timezone.dart' as tz;

class RaceDetailsPage extends StatefulWidget {
  const RaceDetailsPage({
    super.key,
    required this.race,
    required this.initialRegion,
    required this.onSharedRegionChanged,
  });

  final Race2026 race;
  final DisplayRegion initialRegion;
  final ValueChanged<DisplayRegion> onSharedRegionChanged;

  @override
  State<RaceDetailsPage> createState() => _RaceDetailsPageState();
}

class _RaceDetailsPageState extends State<RaceDetailsPage> {
  late DisplayRegion _region = widget.initialRegion;

  void _changeRegion(DisplayRegion region) {
    setState(() => _region = region);
    if (region != DisplayRegion.raceRegion) {
      widget.onSharedRegionChanged(region);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_region == DisplayRegion.raceRegion) {
      return Localizations.override(
        context: context,
        locale: widget.race.interfaceLocale,
        child: Builder(builder: _buildDetails),
      );
    }

    return _buildDetails(context);
  }

  Widget _buildDetails(BuildContext context) {
    final messages = AppLocalizations.of(context)!;
    final race = widget.race;
    final settings = _region.settings(race);
    final locale = Intl.verifiedLocale(
      Intl.canonicalizedLocale(settings.locale.toLanguageTag()),
      DateFormat.localeExists,
      onFailure: (_) => messages.localeName,
    );
    final start = tz.TZDateTime.from(
      race.startUtc,
      tz.getLocation(settings.timeZone),
    );

    return Scaffold(
      appBar: AppBar(title: Text(messages.raceName(race.name))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DisplayRegionPicker(
              value: _region,
              includeRaceRegion: true,
              onChanged: _changeRegion,
            ),
            ListTile(
              leading: const Icon(Icons.place_outlined),
              title: Text(messages.circuitLabel),
              subtitle: Text(messages.circuitName(race.name)),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined),
              title: Text(messages.raceDateLabel),
              subtitle: Text(DateFormat.yMMMMd(locale).format(start)),
            ),
            ListTile(
              leading: const Icon(Icons.schedule_outlined),
              title: Text(messages.raceStartLabel),
              subtitle: Text(
                messages.raceTimeWithZone(
                  DateFormat.jm(locale).format(start),
                  start.timeZoneName,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
