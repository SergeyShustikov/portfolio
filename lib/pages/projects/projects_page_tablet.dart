import 'package:flutter/material.dart';
import 'package:portfolio/pages/projects/projects_page.dart';
import 'package:portfolio/theming/palette.dart';
import 'package:portfolio/widgets/app_bar.dart';
import 'package:web_scaffold/web_scaffold.dart';

class ProjectsPageTablet extends StatelessWidget {
  final List<Project> projects;
  const ProjectsPageTablet(this.projects, {super.key});

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      bodyConfiguration: const BodyConfiguration([
        BodyPart(),
      ]),
      header: const SiteAppBar(),
      headerSettings: HeaderSettings(
        headerHeight: kToolbarHeight + 18,
      ),
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
