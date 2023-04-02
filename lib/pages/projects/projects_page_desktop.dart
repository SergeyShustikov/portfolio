import 'package:flutter/material.dart';
import 'package:portfolio/pages/projects/data/project.dart';
import 'package:portfolio/pages/projects/projects_page.dart';
import 'package:portfolio/theming/palette.dart';

class ProjectsPageDesktop extends StatelessWidget {
  final List<Project> projects;
  const ProjectsPageDesktop(this.projects, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.containerColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: ProjectsGridView(maxItemWidth: 1000, projects: projects),
    );
  }
}
