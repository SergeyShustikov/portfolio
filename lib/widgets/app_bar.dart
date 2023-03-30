import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/feature_flag.dart';
import 'package:portfolio/widgets/content_container.dart';
import 'package:portfolio/widgets/hovering_text.dart';
import 'package:portfolio/widgets/hovering_widget.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class SiteAppBar extends StatelessWidget with LayoutTypeDeterminatorMixin {
  const SiteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopView: _buildDesktopAppBar(context),
      mobileView: _buildMobileAppBar(context),
    );
  }

  Widget _buildDesktopAppBar(BuildContext context) {
    return Column(
      children: [
        ContentContainer(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
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
                  Visibility(
                    visible: FeatureFlag.kBlogEnabled,
                    child: HoveringText(
                      'Blog',
                      onTap: () {
                        debugPrint('On blog tap');
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
                    'About me',
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

  Widget _buildMobileAppBar(BuildContext context) {
    return Column(
      children: [
        ContentContainer(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          child: Align(
            alignment: Alignment.centerRight,
            child: HoveringWidget(
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
