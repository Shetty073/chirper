import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'texttheme.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static var brightness = SchedulerBinding.instance?.window.platformBrightness;
  static bool isDarkTheme = brightness == Brightness.dark;

  CustomTheme() {
    SharedPreferences.getInstance().then((SharedPreferences prefs) {
      if (prefs.getBool('isDarkTheme') != null) {
        isDarkTheme = prefs.getBool('isDarkTheme')!;
        notifyListeners();
      }
    });
  }

  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;

    SharedPreferences.getInstance().then((SharedPreferences pref) {
      pref.setBool('isDarkTheme', isDarkTheme);
      notifyListeners();
    });
  }

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(),
    labelStyle: GoogleFonts.roboto(
      fontSize: 20.0,
      color: Colors.blue,
    ),
    hintStyle: GoogleFonts.roboto(
      color: Colors.grey,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
  );

  static ThemeData get lightTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: Colors.blue, secondary: Colors.blueAccent),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      dialogBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: CustomTextTheme.light,
      inputDecorationTheme: inputDecorationTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.black,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent),
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      dialogBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, foregroundColor: Colors.blue),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: CustomTextTheme.dark,
      inputDecorationTheme: inputDecorationTheme,
    );
  }
}
