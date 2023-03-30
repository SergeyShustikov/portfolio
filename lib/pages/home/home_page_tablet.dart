import 'package:flutter/material.dart';
import 'package:portfolio/widgets/app_bar.dart';
import 'package:portfolio/widgets/content_container.dart';
import 'package:web_scaffold/web_scaffold.dart';

class HomePageTablet extends StatelessWidget {
  const HomePageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      bodyConfiguration: const BodyConfiguration([BodyPart()]),
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
