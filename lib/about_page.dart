import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/layout_carcase.dart';
import 'package:portfolio/text/text_paragraph.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return WebsiteCarcase(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Text('About me'),
            SizedBox(height: 8),
            TextParagraph(
                'I have almost 9 years of experience in software development. I have a solid understanding and knowledgeof object-oriented approaches, software engineering principles(SOLID/YAGNI/KISS), and concepts. I have experience in leading teams (up to 5 teamates) in terms of Agile, implementation of application architecture from 0 to production.\nI have participated in life cycle of several software projects of various sizes. On projects my main responsibilities were: application architecture design, code refactoring, optimization. I’m absolutely skilled in creating awesome UI widgets (views) with complex animations using shaders, curves, math, and everything that can help with creating nice-looking views.\nAuthor of wave_loading_indicator library (https://pub.dev/packages/wave_loading_indicator)'),
            EmploymentHistoryItem(
              companyName: 'Framey.io',
              position: 'Senior Flutter Developer',
              date: 'March 2022 - Present',
              description:
                  'Created website for casino project with responsive layouts. Worked on applications for SPA complex and project with cryptocurrency project based on VPN sharing.',
              tools: [
                'GetX',
                'flutter_gen',
                'Dart',
                'Flutter',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmploymentHistoryItem extends StatelessWidget {
  final String companyName;
  final String position;
  final String date;
  final String description;
  final List<String> tools;

  const EmploymentHistoryItem({
    super.key,
    required this.companyName,
    required this.position,
    required this.date,
    required this.description,
    required this.tools,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            companyName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.blue,
              fontFamily: GoogleFonts.ubuntu().fontFamily,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                position,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                ),
              ),
              const Spacer(),
              const Icon(
                EvaIcons.calendarOutline,
                color: Colors.blue,
              ),
              const SizedBox(width: 4),
              Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                EvaIcons.arrowRight,
                color: Colors.blue,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: [
              SizedBox(
                width: 48,
                height: 32,
                child: Center(
                  child: Text(
                    'Tools :',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                    ),
                  ),
                ),
              ),
              ...tools.map((e) => TechnologyChip(e)).toList(),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class TechnologyChip extends StatelessWidget {
  final String text;
  const TechnologyChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
      ),
    );
  }
}
