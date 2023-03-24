import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/hovering_text.dart';
import 'package:portfolio/ui/palette.dart';

class SiteAppBar extends StatelessWidget {
  const SiteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.containerColor,
      padding: const EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HoveringText(
            'Sergey Shustikov',
            noHover: true,
            style: TextStyle(
              fontFamily: GoogleFonts.ubuntu().fontFamily,
              fontSize: 18,
              color: Colors.white,
            ),
            onTap: () {
              context.go('/');
            },
          ),
          const Spacer(),
          HoveringText(
            'Blog',
            onTap: () {
              debugPrint('On blog tap');
            },
          ),
          const SizedBox(width: 24),
          HoveringText(
            'Projects',
            onTap: () {
              debugPrint('On Projects tap');
            },
          ),
          const SizedBox(width: 24),
          HoveringText(
            'About',
            onTap: () {
              context.go('/about');
            },
          ),
        ],
      ),
    );
  }
}
