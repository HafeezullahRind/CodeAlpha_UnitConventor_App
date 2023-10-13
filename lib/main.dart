import 'package:conventor_app/views/homeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Unit Conventor App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: HomeScreen());
  }
}
