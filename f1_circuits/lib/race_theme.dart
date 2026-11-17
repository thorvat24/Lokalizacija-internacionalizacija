import 'package:material_ui/material_ui.dart';

ThemeData buildRaceTheme() {
  const background = Color(0xFF080F20);
  const panel = Color(0xFF121E37);
  const control = Color(0xFF192746);
  const outline = Color(0xFF334569);
  const red = Color(0xFFC92641);
  const gold = Color(0xFFFFD435);
  const foreground = Color(0xFFF5F7FF);
  const muted = Color(0xFFBAC7E2);

  final colors =
      ColorScheme.fromSeed(
        seedColor: panel,
        brightness: Brightness.dark,
      ).copyWith(
        primary: const Color(0xFFFF6B80),
        onPrimary: background,
        secondary: gold,
        onSecondary: background,
        surface: panel,
        surfaceContainerHigh: control,
        onSurface: foreground,
        onSurfaceVariant: muted,
        outline: outline,
        outlineVariant: outline,
      );

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(color: outline),
  );

  return ThemeData(
    colorScheme: colors,
    scaffoldBackgroundColor: background,
    appBarTheme: const AppBarThemeData(
      backgroundColor: background,
      foregroundColor: foreground,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleSpacing: 16,
      titleTextStyle: TextStyle(
        color: foreground,
        fontFamily: 'Roboto',
        fontSize: 21,
        fontWeight: FontWeight.w800,
        height: 1.1,
      ),
    ),
    cardTheme: CardThemeData(
      color: panel,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: outline),
      ),
    ),
    chipTheme: const ChipThemeData(
      backgroundColor: control,
      selectedColor: red,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide(color: outline),
      shape: StadiumBorder(),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: control,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: const BorderSide(color: gold, width: 2),
      ),
      labelStyle: const TextStyle(color: muted, fontWeight: FontWeight.w600),
      floatingLabelStyle: const TextStyle(
        color: gold,
        fontWeight: FontWeight.w700,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      textColor: foreground,
      iconColor: gold,
    ),
    dividerTheme: const DividerThemeData(
      color: outline,
      space: 1,
      thickness: 1,
    ),
  );
}
