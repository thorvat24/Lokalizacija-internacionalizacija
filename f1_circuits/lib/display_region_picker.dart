import 'package:f1_circuits/display_region.dart';
import 'package:f1_circuits/docs_demo/l10n/app_localizations.dart';
import 'package:material_ui/material_ui.dart';

class DisplayRegionPicker extends StatelessWidget {
  const DisplayRegionPicker({
    super.key,
    required this.value,
    required this.onChanged,
    this.includeRaceRegion = false,
  });

  final DisplayRegion value;
  final ValueChanged<DisplayRegion> onChanged;
  final bool includeRaceRegion;

  @override
  Widget build(BuildContext context) {
    final messages = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final options = includeRaceRegion
        ? DisplayRegion.forRace
        : DisplayRegion.shared;

    return InputDecorator(
      decoration: InputDecoration(
        labelText: messages.displayRegionLabel,
        prefixIcon: const Icon(Icons.language_rounded, size: 20),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<DisplayRegion>(
          value: value,
          isExpanded: true,
          dropdownColor: colors.surfaceContainerHigh,
          iconEnabledColor: colors.secondary,
          borderRadius: BorderRadius.circular(14),
          items: [
            for (final option in options)
              DropdownMenuItem(
                value: option,
                child: Text(messages.displayRegionName(option.name)),
              ),
          ],
          onChanged: (region) {
            if (region != null) onChanged(region);
          },
        ),
      ),
    );
  }
}
