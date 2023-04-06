import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theming/palette.dart';
import 'package:portfolio/utils/utils.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kDefaultPadding,
      decoration: BoxDecoration(
        color: Palette.containerColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Hi!',
                  style: GoogleFonts.ubuntu(fontSize: 36),
                ),
                const Text(
                  'I\'m Sergey, Senior Flutter Developer.',
                ),
                Text(
                  'On this website you can find information about me, projects and other stuff. Hi there 👋',
                  style: GoogleFonts.ubuntu(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
