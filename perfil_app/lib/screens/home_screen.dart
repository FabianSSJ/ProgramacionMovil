import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Vergil.jpeg', width: 150),
            SizedBox(height: 20),
            Text('Bienvenido a Mi Perfil', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Veces que presionaste: $_counter'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Contar'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Ver Perfil'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
