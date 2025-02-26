import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_hotline_app/views/home_ui.dart';
import 'package:thai_hotline_app/views/introduction_ui.dart';
//import 'package:thai_hotline_app/views/introduction_ui.dart';

void main() {
  runApp(const ThaiHotLineApp());
}

class ThaiHotLineApp extends StatefulWidget {
  const ThaiHotLineApp({super.key});

  @override
  State<ThaiHotLineApp> createState() => _ThaiHotLineApp();
}

class _ThaiHotLineApp extends State<ThaiHotLineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroductionUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
