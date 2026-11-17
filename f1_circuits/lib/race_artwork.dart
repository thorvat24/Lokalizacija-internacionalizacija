import 'package:f1_circuits/race_2026.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

extension RaceArtwork on Race2026 {
  String get circuitAsset => switch (this) {
    Race2026.australia => 'assets/tracks/albert_park.svg',
    Race2026.china => 'assets/tracks/shanghai.svg',
    Race2026.japan => 'assets/tracks/suzuka.svg',
    Race2026.miami => 'assets/tracks/miami.svg',
    Race2026.canada => 'assets/tracks/villeneuve.svg',
    Race2026.monaco => 'assets/tracks/monaco.svg',
    Race2026.barcelona => 'assets/tracks/catalunya.svg',
    Race2026.austria => 'assets/tracks/red_bull_ring.svg',
    Race2026.greatBritain => 'assets/tracks/silverstone.svg',
    Race2026.belgium => 'assets/tracks/spa.svg',
    Race2026.hungary => 'assets/tracks/hungaroring.svg',
    Race2026.netherlands => 'assets/tracks/zandvoort.svg',
    Race2026.italy => 'assets/tracks/monza.svg',
    Race2026.spain => 'assets/tracks/madring.svg',
    Race2026.azerbaijan => 'assets/tracks/baku.svg',
    Race2026.bahrain => 'assets/tracks/sepang.png',
    Race2026.singapore => 'assets/tracks/marina_bay.svg',
    Race2026.unitedStates => 'assets/tracks/americas.svg',
    Race2026.mexicoCity => 'assets/tracks/rodriguez.svg',
    Race2026.saoPaulo => 'assets/tracks/interlagos.svg',
    Race2026.lasVegas => 'assets/tracks/vegas.svg',
    Race2026.qatar => 'assets/tracks/losail.svg',
    Race2026.abuDhabi => 'assets/tracks/yas_marina.svg',
  };

  String get hostFlagAsset =>
      'assets/flags/${interfaceLocale.countryCode!.toLowerCase()}.svg';
}

class CircuitArtwork extends StatelessWidget {
  const CircuitArtwork({super.key, required this.race}) : _thumbnail = false;

  const CircuitArtwork.thumbnail({super.key, required this.race})
    : _thumbnail = true;

  final Race2026 race;
  final bool _thumbnail;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final path = race.circuitAsset;

    return SizedBox(
      width: _thumbnail ? 64 : double.infinity,
      height: _thumbnail ? 54 : 152,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_thumbnail ? 10 : 16),
          border: Border.all(color: colors.outlineVariant),
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [colors.surfaceContainerHigh, colors.surface],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.all(_thumbnail ? 7 : 14),
                child: path.endsWith('.svg')
                    ? SvgPicture.asset(
                        path,
                        colorFilter: ColorFilter.mode(
                          colors.secondary,
                          BlendMode.srcIn,
                        ),
                        excludeFromSemantics: true,
                      )
                    : Image.asset(
                        path,
                        fit: BoxFit.contain,
                        color: colors.secondary,
                        colorBlendMode: BlendMode.srcIn,
                        excludeFromSemantics: true,
                      ),
              ),
            ),
            if (!_thumbnail)
              PositionedDirectional(
                top: 12,
                end: 12,
                child: HostFlag(race: race, width: 32),
              ),
          ],
        ),
      ),
    );
  }
}

class HostFlag extends StatelessWidget {
  const HostFlag({super.key, required this.race, this.width = 24});

  final Race2026 race;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: SvgPicture.asset(
        race.hostFlagAsset,
        width: width,
        height: width * 0.75,
        fit: BoxFit.cover,
        excludeFromSemantics: true,
      ),
    );
  }
}
