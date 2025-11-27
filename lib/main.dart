import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shopping_app/repository/screens/introscreen.dart';
import 'package:shopping_app/repository/screens/mainscreen.dart';
import 'package:shopping_app/repository/screens/playgroundscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: {
      //   "/": (context) => IntroScreen(),
      //   "home": (context) => MainScreen(),
      // },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6A5ACD),
          primary: const Color(0xFF6A5ACD),
          secondary: const Color(0xFFFF6B6D),
          surface: Colors.white,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF6A5Acd),
          elevation: 0,
          centerTitle: false,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7FA),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff6A5ACD),
          unselectedItemColor: Colors.grey[400],
          elevation: 10,
          showUnselectedLabels: false,
        ),
      ),
      home: PlayGroundScreen(),
    );
  }
}
