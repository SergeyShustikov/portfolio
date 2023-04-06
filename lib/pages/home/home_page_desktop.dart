import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theming/palette.dart';
import 'package:portfolio/utils/utils.dart';

///
/// Emojify the input text.
///
/// For example: 'I :heart: :coffee:' => 'I ❤️ ☕'
///
class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
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
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Hi!',
                style: GoogleFonts.ubuntu(fontSize: 36),
              ),
              Text(
                'I\'m Sergey, Senior Flutter Developer. ${parser.emojify('I :heart: :coffee:')}I ❤️ ☕ 😆',
                // style: GoogleFonts.notoEmoji(fontSize: 18),
              ),
              Text(
                'On this website you can find information about me, projects and other stuff. Hi there 👋',
                style: GoogleFonts.ubuntu(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
