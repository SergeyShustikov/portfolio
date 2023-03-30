import 'package:flutter/material.dart';
import 'package:portfolio/pages/projects/projects_page.dart';
import 'package:portfolio/theming/palette.dart';
import 'package:portfolio/widgets/app_bar.dart';
import 'package:portfolio/widgets/mobile_drawer.dart';
import 'package:web_scaffold/web_scaffold.dart';

class ProjectsPageMobile extends StatelessWidget {
  final List<Project> projects;
  const ProjectsPageMobile(this.projects, {super.key});

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      bodyConfiguration: const BodyConfiguration([BodyPart()]),
      drawer: const MobileDrawer(),
      header: const SiteAppBar(),
      headerSettings: HeaderSettings(
        headerHeight: kToolbarHeight + 18,
      ),
      bodyKey: const PageStorageKey(300),
      body: Container(
        decoration: BoxDecoration(
          color: Palette.containerColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: ProjectsGridView(maxItemWidth: 1000, projects: projects),
      ),
    );
  }
}
