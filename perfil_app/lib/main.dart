// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:perfil_app/providers/theme_provider.dart'; // Importamos ThemeProvider
import 'screens/home_screen.dart'; // Importamos HomeScreen
import 'screens/profile_screen.dart'; // Importamos ProfileScreen
import 'screens/settings_screen.dart'; // Importamos SettingsScreen

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Agregamos el parámetro 'key'

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Perfil',
      theme: Provider.of<ThemeProvider>(context).currentTheme, // Usa el tema dinámico
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(), // Ruta inicial
        '/profile': (context) => ProfileScreen(), // Ruta del perfil
        '/settings': (context) => SettingsScreen(), // Ruta de ajustes
      },
    );
  }
}