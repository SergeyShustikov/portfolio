import 'package:flutter/material.dart';
import 'package:portfolio/app_bar.dart';
import 'package:portfolio/ui/palette.dart';
import 'package:web_scaffold/web_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      bodyConfiguration: const BodyConfiguration([FlexPart(1), BodyPart(4), FlexPart(1)]),
      header: const SiteAppBar(),
      headerSettings: HeaderSettings(
        headerHeight: kToolbarHeight + 18,
      ),
      body: Container(
        color: Palette.primaryColor,
        height: 300,
      ),
    );
  }
}
