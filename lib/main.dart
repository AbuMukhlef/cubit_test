import 'package:flutter/material.dart';
import 'package:cubit_test/screen/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'myFont'),
      home: HomeScreen(),
    );
  }
}
