import 'package:chirper/data/models/chirp.dart';
import 'package:chirper/data/models/user.dart';
import 'package:chirper/screens/auth_screens/login_screen.dart';
import 'package:chirper/screens/auth_screens/register_screen.dart';
import 'package:chirper/screens/chirp_screen/chirp_screen.dart';
import 'package:chirper/screens/loading_screen/loading_screen.dart';
import 'package:chirper/screens/main_screens/main_screen.dart';
import 'package:chirper/screens/profile_screen/profile_screen.dart';
import 'package:chirper/screens/profile_screen/show_profile_image.dart';
import 'package:chirper/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ChirpAdapter());
  await Hive.openLazyBox<Chirp>('chirps');
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');

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

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

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
        '/chirp': (context) => SafeArea(
              child: ChirpScreen(),
            ),
        '/profile': (context) => SafeArea(
              child: ProfileScreen(),
            ),
        '/show_profile_photo': (context) => SafeArea(
              child: ShowProfileImage(),
            ),
      },
    );
  }
}
