import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/hovering_text.dart';
import 'package:portfolio/hovering_widget.dart';
import 'package:portfolio/layout_carcase.dart';
import 'package:portfolio/ui/palette.dart';

class SiteAppBar extends StatelessWidget with LayoutTypeDeterminatorMixin {
  const SiteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Palette.containerColor,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HoveringWidget(
                    child: GestureDetector(
                      child: Text(
                        'Sergey Shustikov',
                        style: TextStyle(
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        context.go('/');
                      },
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: HoveringText(
                      'Blog',
                      onTap: () {
                        debugPrint('On blog tap');
                        context.go('/test');
                      },
                    ),
                  ),
                  const SizedBox(width: 24),
                  HoveringText(
                    'Projects',
                    onTap: () {
                      context.go('/projects');
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
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.white,
        ),
      ],
    );
  }
}
