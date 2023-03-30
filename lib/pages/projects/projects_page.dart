// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/theming/palette.dart';
import 'package:portfolio/widgets/app_bar.dart';
import 'package:portfolio/widgets/hovering_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_scaffold/web_scaffold.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final List<Project> projects = [
    const Project(
      name: 'Samsung books',
      description:
          'The reworked version of Readershub application for Samsung users. Currently unavailable on market. ',
      image: 'https://lh6.ggpht.com/ahCkY6hyruM1gs5j2jgxCrqfy03BRpgb8iXA1ysk34oKQNAMjYlEiU07Dr2Cvcq3Jxw=s75-rw',
      googlePlayLink: 'https://samsung-books.en.uptodown.com/android',
    ),
    const Project(
      name: 'Mantu',
      description:
          ' This peer-to-peer instant messaging application ensures security and convenience, whether you’re chatting with just one friend or a large group.',
      image:
          'https://play-lh.googleusercontent.com/KNx55BouPkgKZil7d-RcnWiqpHYwZ0x8Sccrx_qoULFuYOzZM9rBrsiZ2rzUV6QlpBM=w480-h960-rw',
      googlePlayLink: 'https://play.google.com/store/apps/details?id=im.mantu.ionic&hl=uk&gl=US',
    ),
    const Project(
      name: 'WSI Energy Trader',
      description:
          'The premier weather decision-support platform for the global commodity markets. Providing support for North American, European, Asian & Australian traders, a comprehensive global outlook is delivered in a single, easy-to-use platform.',
      image:
          'https://play-lh.googleusercontent.com/u7K9MwE5K4AgmqjLItfpnGxbR1EhI5mztkntuYo7QTs0E6U-9IwD3X8GP0y6cgsoDZg=w480-h960-rw',
      googlePlayLink: 'https://play.google.com/store/apps/details?id=com.wsi.trader&hl=us&gl=US',
    ),
    const Project(
      name: 'Crossplatform, crossbranded application.',
      description: 'This is the fourth project',
      image:
          'https://play-lh.googleusercontent.com/inUl18jZDJiwaTicfaPMaS_-Po__iMIpbfFsy0DmgIWMvmijfosd4isV75qFN8-uMpo=w480-h960-rw',
      googlePlayLink: 'https://play.google.com/store/apps/details?id=com.x100group.sushimaster&hl=us&gl=US',
      appStoreLink: 'https://play.google.com/store/apps/details?id=com.x100group.sushimaster&hl=us&gl=US',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      bodyConfiguration: const BodyConfiguration([FlexPart(), BodyPart(flex: 4), FlexPart()]),
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

class Project {
  final String name;
  final String description;
  final String? image;
  final String? googlePlayLink;
  final String? appStoreLink;

  const Project({
    required this.name,
    required this.description,
    this.image,
    this.googlePlayLink,
    this.appStoreLink,
  });

  Uri getGooglePlayUri() => Uri.parse(googlePlayLink!);
  Uri getAppStoreUri() => Uri.parse(appStoreLink!);
}

class ProjectsGridView extends StatelessWidget {
  final List<Project> projects;
  final double maxItemWidth;

  const ProjectsGridView({
    required this.projects,
    required this.maxItemWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projects.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final project = projects[index];

        return Card(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox.square(
                  dimension: 200,
                  child: project.image != null
                      ? Center(
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white70), borderRadius: BorderRadius.circular(36)),
                            child: Image.network(
                              project.image!,
                              fit: BoxFit.scaleDown,
                              width: 180,
                              height: 180,
                            ),
                          ),
                        ))
                      : Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.white70)),
                          child: const Center(
                            child: Text(
                              'No Image',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        project.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      if (project.googlePlayLink != null || project.appStoreLink != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (project.googlePlayLink != null)
                              GestureDetector(
                                onTap: () async {
                                  if (await canLaunchUrl(project.getGooglePlayUri())) {
                                    await launchUrl(project.getGooglePlayUri());
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Could not launch url'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                child: HoveringWidget(child: Assets.images.googleButton.image(width: 160, height: 120)),
                              ),
                            if (project.appStoreLink != null)
                              GestureDetector(
                                onTap: () async {
                                  if (await canLaunchUrl(project.getAppStoreUri())) {
                                    await launchUrl(project.getAppStoreUri());
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Could not launch url'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                child: HoveringWidget(child: Assets.images.appleButton.image(width: 160, height: 120)),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}