import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Page Not Found',
          style: GoogleFonts.ubuntu(fontSize: 48),
        ),
      ),
    );
  }
}
