import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/technologies.dart';
import 'package:portfolio/pages/about/about_page_desktop.dart';
import 'package:portfolio/pages/about/about_page_mobile.dart';
import 'package:portfolio/pages/about/about_page_tablet.dart';
import 'package:portfolio/theming/palette.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'package:portfolio/utils/ui_utils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/ui_library.dart';
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
        bodyConfiguration: getBodyConfiguration(context),
        drawer: context.isMobile() ? const MobileDrawer() : null,
        header: const SiteAppBar(),
        headerSettings: HeaderSettings(headerHeight: kHeaderHeight),
        body: const ResponsiveWidget(
          desktopView: AboutPageDesktop(),
          tabletView: AboutPageTablet(),
          mobileView: AboutPageMobile(),
        ),
        footer: const SiteFooter(),
      ),
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
      padding: kDefaultPaddingVertical / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            companyName,
            style: kHeaderTextStyleBigBold.copyWith(color: Colors.blue),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  position,
                  style: kNormalTextStyleBigBold,
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
                    style: kSmallTextStyle,
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
                  style: kNormalTextStyle,
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
        style: kNormalTextStyle,
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
      padding: kDefaultPaddingVertical / 2,
      label: Text(
        text,
        style: kNormalTextStyle,
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
        style: kNormalTextStyle,
      ),
    );
  }
}
