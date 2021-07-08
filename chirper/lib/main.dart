import 'package:chirper/screens/chirp_screen.dart';
import 'package:flutter/material.dart';
import 'package:chirper/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(title: 'Chirper'),
        '/chirp': (context) => ChirpScreen(),
      },
    );
  }
}

