import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.red,
  Colors.blue,
  Colors.pink,
  Colors.cyanAccent,
  Colors.blueAccent,
  Colors.brown,
]; 

class AppTheme {
  final int selectedSeedColor;
  final bool isDarkMode;

  AppTheme({this.selectedSeedColor = 0, this.isDarkMode = false});

  ThemeData theme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colors[selectedSeedColor],
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    listTileTheme: ListTileThemeData(
      iconColor: colors[selectedSeedColor]
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    )
  );
}
