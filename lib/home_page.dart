import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/hovering_text.dart';
import 'package:portfolio/ui/palette.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 5),
          child: Column(
            children: <Widget>[
              _buildAppBar(),
              const SizedBox(height: 8),
              _buildBody(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: Palette.containerColor,
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sergey Shustikov',
            style: TextStyle(
              fontFamily: GoogleFonts.ubuntu().fontFamily,
              fontSize: 18,
              color: Colors.white,
            ),
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
              debugPrint('On About tap');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      height: 300,
      color: Palette.containerColor,
    );
  }

  Widget _buildFooter() {
    return SizedBox(
      height: 72,
      child: Row(
        children: const [],
      ),
    );
  }
}
