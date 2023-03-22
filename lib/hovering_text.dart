import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/ui/palette.dart';

class HoveringText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final VoidCallback onTap;
  const HoveringText(
    this.text, {
    super.key,
    required this.onTap,
    this.style,
  });

  @override
  State<HoveringText> createState() => _HoveringTextState();
}

class _HoveringTextState extends State<HoveringText> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        _hovering = true;
      }),
      onExit: (event) => setState(() {
        _hovering = false;
      }),
      cursor: _hovering ? SystemMouseCursors.click : SystemMouseCursors.none,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _hovering ? Colors.white : Palette.containerColor,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                widget.text,
                style: widget.style ?? _buildHeaderStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _buildHeaderStyle() {
    return TextStyle(
      fontSize: 14,
      fontFamily: GoogleFonts.ubuntu().fontFamily,
      color: const Color(0xffE8EAED),
    );
  }
}
