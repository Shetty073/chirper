import 'package:chirper/screens/LoadingScreen.dart';
import 'package:chirper/screens/chirp_screen.dart';
import 'package:chirper/screens/login_screen.dart';
import 'package:chirper/screens/register_screen.dart';
import 'package:chirper/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:chirper/screens/main_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).backgroundColor,
      systemNavigationBarColor: Theme.of(context).backgroundColor,
    ));

    currentTheme.addListener(() {
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chirper',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => SafeArea(child: LoadingScreen()),
        '/login': (context) => SafeArea(child: LoginScreen()),
        '/register': (context) => SafeArea(child: RegisterScreen()),
        '/': (context) => SafeArea(child: MainScreen(title: 'Chirper')),
        '/chirp': (context) => SafeArea(child: ChirpScreen(),),
      },
    );
  }
}


