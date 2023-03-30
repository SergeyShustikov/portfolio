import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/about/about_page_desktop.dart';
import 'package:portfolio/pages/about/about_page_mobile.dart';
import 'package:portfolio/pages/about/about_page_tablet.dart';
import 'package:portfolio/theming/palette.dart';
import 'package:portfolio/utils/technologies.dart';
import 'package:portfolio/widgets/app_bar.dart';
import 'package:portfolio/widgets/mobile_drawer.dart';
import 'package:portfolio/widgets/responsive_widget.dart';
import 'package:web_scaffold/web_scaffold.dart';

class AboutPage extends StatelessWidget with LayoutTypeDeterminatorMixin {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.blue,
      title: 'Sergey Shustikov | About me',
      child: WebScaffold(
        bodyKey: const PageStorageKey(300),
        bodyConfiguration: _getBodyConfiguration(context),
        drawer: isMobile(context) ? const MobileDrawer() : null,
        header: const SiteAppBar(),
        headerSettings: HeaderSettings(
          headerHeight: kToolbarHeight + 18,
        ),
        body: const ResponsiveWidget(
          desktopView: AboutPageDesktop(),
          tabletView: AboutPageTablet(),
          mobileView: AboutPageMobile(),
        ),
      ),
    );
  }

  BodyConfiguration _getBodyConfiguration(BuildContext context) {
    if (isDesktop(context)) {
      return const BodyConfiguration([
        FlexPart(),
        BodyPart(flex: 4),
        FlexPart(),
      ]);
    } else {
      return const BodyConfiguration([
        BodyPart(),
      ]);
    }
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
