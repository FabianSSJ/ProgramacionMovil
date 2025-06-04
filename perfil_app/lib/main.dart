import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Para el estado del tema
import 'providers/theme_provider.dart'; // Proveedor del tema
import 'screens/home_screen.dart';

void main() => runApp(
  ChangeNotifierProvider( // Envuelve la app con el proveedor
    create: (_) => ThemeProvider(),
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Mi Perfil',
      theme: themeProvider.currentTheme, // Usa el tema dinámico personalizado
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}