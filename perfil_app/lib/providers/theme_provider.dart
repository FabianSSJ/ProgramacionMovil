import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.orange,
    scaffoldBackgroundColor: Color(0xFFFFF8E1),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.orange,
    scaffoldBackgroundColor: Colors.grey[900],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
    ),
  );
}