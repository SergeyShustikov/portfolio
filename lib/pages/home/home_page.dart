import 'package:flutter/material.dart';
import 'package:portfolio/pages/home/home_page_desktop.dart';
import 'package:portfolio/pages/home/home_page_mobile.dart';
import 'package:portfolio/pages/home/home_page_tablet.dart';
import 'package:portfolio/utils/ui_utils.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/ui_library.dart';
import 'package:web_scaffold/web_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.blue,
      title: 'Sergey Shustikov | Portfolio',
      child: WebScaffold(
        bodyKey: const PageStorageKey(300),
        bodyConfiguration: getBodyConfiguration(context),
        drawer: context.isMobile() ? const MobileDrawer() : null,
        header: const SiteAppBar(),
        headerSettings: HeaderSettings(headerHeight: kHeaderHeight),
        footer: const SiteFooter(),
        body: const ResponsiveWidget(
          desktopView: HomePageDesktop(),
          tabletView: HomePageTablet(),
          mobileView: HomePageMobile(),
        ),
      ),
    );
  }
}
