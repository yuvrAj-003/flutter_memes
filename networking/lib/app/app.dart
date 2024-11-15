import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:networking/theme.dart';
import 'package:networking/themes.dart';
import 'package:networking/views/HomeView.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "memer app",
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: MyThemes.lightTheme,
            fontFamily: GoogleFonts.dmSans().fontFamily),
        darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: MyThemes.darkTheme,
            fontFamily: GoogleFonts.dmSans().fontFamily),
        home: const HomeView());
  }
}
