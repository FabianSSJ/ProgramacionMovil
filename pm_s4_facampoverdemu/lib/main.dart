import 'package:flutter/material.dart';
import 'package:pm_s4_facampoverdemu/config/theme/app_theme.dart';
import 'package:pm_s4_facampoverdemu/presentation/chat/chat_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 6).theme(),
      home: Scaffold(
        appBar: AppBar (
          title: Text("Flutter demo"),
    ),
    body: ChatScreen(),
    ),
    );
  }
}