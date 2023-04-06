// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/pages/about/about_page.dart';
import 'package:portfolio/pages/home/home_page.dart';
import 'package:portfolio/pages/not_found/page_not_found.dart';
import 'package:portfolio/pages/projects/projects_page.dart';
import 'package:portfolio/theming/palette.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // GoRouter configuration
    final router = GoRouter(
      errorBuilder: (context, state) {
        return const PageNotFound();
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/about',
          builder: (context, state) => const AboutPage(),
        ),
        GoRoute(
          path: '/projects',
          builder: (context, state) => const ProjectsPage(),
        ),
      ],
    );

    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        // fontFamily: GoogleFonts.rubik().fontFamily,
        colorScheme: ColorScheme.dark(
          background: Palette.backgroundColor,
          primary: Palette.primaryColor,
          secondary: Palette.primaryColorLight,
          onPrimary: Palette.actionColor,
        ),
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
