import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextHeader extends StatelessWidget {
  final String text;

  const TextHeader(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _headerStyle,
    );
  }

  TextStyle get _headerStyle => TextStyle(
        fontSize: 14,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        color: const Color(0xffE8EAED),
      );
}
