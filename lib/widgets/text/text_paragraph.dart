// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TextParagraph extends StatelessWidget {
  final String text;

  const TextParagraph(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> paragraphs = text.split("\n");
    List<TextSpan> textSpans = [];

    final RegExp linkRegExp = RegExp(
      r'((?:https?://)[\w\-_]+(?:\.[\w\-_]+)+(?:[\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?)',
      caseSensitive: false,
    );

    for (int i = 0; i < paragraphs.length; i++) {
      String paragraph = paragraphs[i];

      if (paragraph.isNotEmpty) {
        final String firstChar = paragraph.substring(0, 1);
        textSpans.add(
          TextSpan(
            text: firstChar,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: GoogleFonts.ubuntu().fontFamily,
            ),
          ),
        );

        if (paragraph.length > 1) {
          final String restOfParagraph = paragraph.substring(1);

          final Iterable<Match> matches = linkRegExp.allMatches(restOfParagraph);
          int matchEndIndex = 0;
          for (Match match in matches) {
            if (match.start > matchEndIndex) {
              textSpans.add(
                TextSpan(
                  text: restOfParagraph.substring(matchEndIndex, match.start),
                  style: TextStyle(
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              );
            }
            final String link = match.group(0)!;
            final Uri uri = Uri.parse(link);
            textSpans.add(
              TextSpan(
                text: link,
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not launch url'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
              ),
            );
            matchEndIndex = match.end;
          }

          if (matchEndIndex < restOfParagraph.length) {
            textSpans.add(
              TextSpan(
                text: restOfParagraph.substring(matchEndIndex),
                style: TextStyle(
                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                ),
              ),
            );
          }
        }
      }

      if (i < paragraphs.length - 1) {
        textSpans.add(TextSpan(text: "\n", style: TextStyle(fontFamily: GoogleFonts.ubuntu().fontFamily)));
      }
    }

    return Text.rich(
      TextSpan(
        children: textSpans,
      ),
      softWrap: true,
    );
  }
}
