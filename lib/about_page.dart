import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/text/text_paragraph.dart';
import 'package:portfolio/ui/palette.dart';
import 'package:web_scaffold/web_scaffold.dart';

import 'app_bar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return WebScaffold(
      bodyConfiguration: const BodyConfiguration([FlexPart(1), BodyPart(4), FlexPart(1)]),
      header: const SiteAppBar(),
      headerSettings: HeaderSettings(
        headerHeight: kToolbarHeight + 18,
      ),
      body: Container(
        height: 4000,
        color: Palette.containerColor,
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
            EmploymentHistoryItem(
              companyName: 'IT X100',
              position: 'Senior Android Developer -> Senior Flutter Developer -> Flutter Stack Lead',
              date: 'September 2020 - February 2022',
              description:
                  'In ITx100 firstly I came as an Android developer and I had to refactor old application - merge 3 different repositories into a single codebase, refactor the application to use flavors and different build settings to make production faster. Then in a few months, we decided to start a new version of the application using Flutter. In two years we created a multibranding application constructor that is flexible as much as possible.',
              tools: [
                'Android/Java/Kotlin',
                'Flutter',
                'Flutter for Web',
                'Isolates',
                'Platform Method Channels',
                'Sentry(for errors catching)',
                'Firebase ecosystem(Firestore, FCM, Storage, App distribution)',
                'Dart null-safety library migration',
                'Code generation libraries (freezed, JsonSerializable)',
                'Bloc state management library',
                'Analytics (AppsFlyer/Amplitude/Google analytics)',
                'Google Maps/Yandex Maps(changed-ported to project needs)',
                'Amplitude',
                'Linter',
              ],
            ),
            EmploymentHistoryItem(
              companyName: 'Life 360',
              position: 'Senior Android Developer',
              date: 'January 2020 - August 2020',
              description:
                  'Life360 - is the family locator that helps people to track the location of each other with additional features (like driving speed, walk speed, pedometer, etc). My responsibilities in this project were: refactoring from Java to Kotlin, implementation of the new menu of application, and user tiers mechanism.',
              tools: [
                'Android native Java development',
                'Networking',
                'Git, Atlassian tools',
                'Scrum / Agile',
                'Dagger',
                'RxJava',
                'Kotlin',
              ],
            ),
            EmploymentHistoryItem(
              companyName: 'Softserve',
              position: 'Senior Android Developer',
              date: 'June 2016 - December 2019',
              description:
                  'All projects are under NDA, but I can reveal some information about what I did in SoftServe. I created 2 projects from 0 to production - both were developed for external customers who work with energy tradings. In the last project, I was involved as outstaff developer for an American company - the project was about booking flats, houses, etc (something like Airbnb or Booking.com)',
              tools: [
                'Android native Java development',
                'Networking',
                'Git, Atlassian tools',
                'Scrum / Agile',
                'Dagger',
                'RxJava',
                'Kotlin',
              ],
            ),
            EmploymentHistoryItem(
              companyName: 'Infopulse',
              position: 'Senior Android Developer',
              date: 'February 2016 - June 2016',
              description:
                  'I was a part of Infopulse expert team working on the military level secure technology based enterprise peer-to-peer instant messaging platform. This platform guarantees the impossibility of an information interception on a physical network level. Typical end customers are financial enterprises. Infopulse customer is an Israel R&D oriented product company with very promising telecom & mobile networks solutions. The successful candidate will be able to participate in the new telecommunication technologies invention.',
              tools: [
                'Android native Java development',
                'Networking',
                'Git, Atlassian tools',
                'Scrum / Agile',
                'Working with smartphone camera & images / recognition technologies',
                'Working with crypto alghorythms (RSA, SHA)',
              ],
            ),
            EmploymentHistoryItem(
              companyName: 'Freelance',
              position: ' Android Developer',
              date: 'April  2015 - January 2016',
              description:
                  'A complete cycle of software development. Analysis, requirements definition, design and development. Refactoring, management issues, support and improvement of the existing code. I working with git, gradle, Enterprise Architect, Crashlytics SDK, OoVoo sdk, Social Network integration - Twitter API, LinkedIn API, Vkontakte SDK, Facebook SDK. Supporting multiple screen design. Working with MediaPlayer API (mp3 visualization).',
              tools: [
                'Android',
                'Kotlin',
                'JUnit',
                'Mockito',
                'ORMLite',
                'Retrofit',
                'Picasso',
                'Twitter API',
                'LinkedIn API',
                'Vkontakte SDK',
                'Facebook SDK',
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  position,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
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
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
