import 'package:flutter/material.dart';
import 'package:portfolio/pages/home/home_page_desktop.dart';
import 'package:portfolio/pages/home/home_page_mobile.dart';
import 'package:portfolio/pages/home/home_page_tablet.dart';
import 'package:portfolio/widgets/responsive_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktopView: HomePageDesktop(),
      tabletView: HomePageTablet(),
      mobileView: HomePageMobile(),
    );
  }
}
