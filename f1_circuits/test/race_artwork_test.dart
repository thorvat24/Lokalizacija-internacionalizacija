import 'dart:ui' as ui;

import 'package:f1_circuits/race_2026.dart';
import 'package:f1_circuits/race_artwork.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'bundles readable artwork for all race circuits and host flags',
    () async {
      final circuits = Race2026.values.map((race) => race.circuitAsset).toSet();
      final flags = Race2026.values.map((race) => race.hostFlagAsset).toSet();

      expect(circuits, hasLength(23));
      expect(flags, hasLength(20));
      expect(Race2026.bahrain.hostFlagAsset, 'assets/flags/my.svg');

      for (final path in [...circuits, ...flags]) {
        if (path.endsWith('.svg')) {
          final artwork = await vg.loadPicture(SvgAssetLoader(path), null);
          expect(artwork.size.isEmpty, isFalse, reason: path);
          artwork.picture.dispose();
        } else {
          final bytes = await rootBundle.load(path);
          final codec = await ui.instantiateImageCodec(
            bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
          );
          final frame = await codec.getNextFrame();
          expect(frame.image.width, greaterThan(1));
          expect(frame.image.height, greaterThan(1));
          frame.image.dispose();
          codec.dispose();
        }
      }
    },
  );
}
