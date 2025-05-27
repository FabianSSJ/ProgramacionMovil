import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isRed = true;

  void _toggleColor() {
    setState(() {
      _isRed = !_isRed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Vergil.jpeg', width: 150),
            SizedBox(height: 20),
            Text('Fabian Campoverde', style: TextStyle(fontSize: 24)),
            Text('Estudiante de Tecnologías de la Información',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleColor,
              child: Text('Cambiar Color'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isRed ? Colors.red : Colors.green,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Volver al inicio'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
