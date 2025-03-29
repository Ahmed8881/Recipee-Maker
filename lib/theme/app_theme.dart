import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryColor = Color(0xFFE8F5E9);
  static final Color accentColor = Colors.orange[700]!;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      surface: primaryColor,
      secondary: accentColor,
    ),
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    cardTheme: CardTheme(elevation: 2),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      titleMedium: TextStyle(color: Colors.black87, fontSize: 16),
      bodyLarge: TextStyle(color: Colors.black87, fontSize: 14),
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
    ),
    dividerTheme: DividerThemeData(color: Colors.grey[300], thickness: 1),
  );
}
