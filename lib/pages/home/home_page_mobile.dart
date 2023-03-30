import 'package:flutter/material.dart';
import 'package:portfolio/widgets/app_bar.dart';
import 'package:portfolio/widgets/content_container.dart';
import 'package:portfolio/widgets/mobile_drawer.dart';
import 'package:web_scaffold/web_scaffold.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      bodyConfiguration: const BodyConfiguration([
        BodyPart(),
      ]),
      drawer: const MobileDrawer(),
      header: const SiteAppBar(),
      headerSettings: HeaderSettings(
        headerHeight: kToolbarHeight + 18,
      ),
      body: const ContentContainer(
        height: 300,
      ),
    );
  }
}
