import 'package:flutter/material.dart';
import 'package:portfolio/home_page.dart';
import 'package:portfolio/ui/palette.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.rubik().fontFamily,
        colorScheme: ColorScheme.dark(
          background: Palette.backgroundColor,
          primary: Palette.primaryColor,
          secondary: Palette.primaryColorLight,
          onPrimary: Palette.actionColor,
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
