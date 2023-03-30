import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/about/about_page_desktop.dart';
import 'package:portfolio/pages/about/about_page_mobile.dart';
import 'package:portfolio/pages/about/about_page_tablet.dart';
import 'package:portfolio/theming/palette.dart';
import 'package:portfolio/utils/technologies.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktopView: AboutPageDesktop(),
      tabletView: AboutPageTablet(),
      mobileView: AboutPageMobile(),
    );
  }
}

class EmploymentHistoryItem extends StatelessWidget {
  final String companyName;
  final String position;
  final String date;
  final String description;
  final List<String> tools;

  const EmploymentHistoryItem({
    super.key,
    required this.companyName,
    required this.position,
    required this.date,
    required this.description,
    required this.tools,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            companyName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
              fontFamily: GoogleFonts.ubuntu().fontFamily,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  position,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    EvaIcons.calendarOutline,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                EvaIcons.arrowRight,
                color: Colors.blue,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              const TechnologyChip('Tools :', noDecoration: true),
              ...tools.map((title) {
                var technology = Technology.findTechnologyByString(title);
                if (technology != null) {
                  return IconTechnologyChip(technology);
                }
                return TechnologyChip(title);
              }).toList(),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class TechnologyChip extends StatelessWidget {
  final String text;
  final bool noDecoration;
  const TechnologyChip(this.text, {super.key, this.noDecoration = false});

  @override
  Widget build(BuildContext context) {
    if (noDecoration) {
      return _NoDecorationChip(text: text);
    } else {
      return _DecoratedChip(text: text);
    }
  }
}

class _DecoratedChip extends StatelessWidget {
  const _DecoratedChip({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
      ),
    );
  }
}

class _NoDecorationChip extends StatelessWidget {
  const _NoDecorationChip({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Palette.containerColor,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(vertical: 8),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
      ),
    );
  }
}

class IconTechnologyChip extends StatelessWidget {
  const IconTechnologyChip(this.technology, {super.key});

  final Technology technology;
  final double iconSize = 18;
  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: technology.icon?.image(width: iconSize, height: iconSize),
      label: Text(
        technology.title,
        style: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
      ),
    );
  }
}
