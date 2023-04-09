import 'package:flutter/material.dart';
import 'package:portfolio/data/technologies.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/theming/palette.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kDefaultPadding,
      decoration: BoxDecoration(
        color: Palette.containerColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Text(
              'Hi, my name is Sergey.',
              style: kNormalTextStyleBig,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'I\'m Senior Flutter Developer and this is my website which has been built on Flutter. Here you can find examples of my work and info about me.\n',
            style: kNormalTextStyleBig,
            textAlign: TextAlign.justify,
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialNetwork(
                icon: Technology.github.icon,
                onTap: () => openLink(context, 'https://github.com/SergeyShustikov'),
              ),
              SocialNetwork(
                icon: Assets.technologyIcons.icLinkedin,
                onTap: () => openLink(context, 'https://www.linkedin.com/in/sergey-shustikov/'),
              ),
              SocialNetwork(
                icon: Assets.technologyIcons.icTelegram,
                onTap: () => openLink(context, 'https://t.me/deathember_ua'),
              ),
              SocialNetwork(
                icon: Assets.technologyIcons.icGmail,
                onTap: () => _sendEmail(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'pandarium.shustikov@gmail.com',
      queryParameters: {'subject': 'CallOut user Profile', 'body': ''},
    );
    launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
  }

  void openLink(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not launch url'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

// 1 - lowest
// 5 - highest
class ResponseLevelWidget extends StatelessWidget {
  final int level;
  const ResponseLevelWidget._(this.level);

  factory ResponseLevelWidget.lowest() => const ResponseLevelWidget._(1);
  factory ResponseLevelWidget.low() => const ResponseLevelWidget._(2);
  factory ResponseLevelWidget.medium() => const ResponseLevelWidget._(3);
  factory ResponseLevelWidget.high() => const ResponseLevelWidget._(4);
  factory ResponseLevelWidget.highest() => const ResponseLevelWidget._(5);

  final Color _colorLowest = Colors.red;
  Color? get _colorLow => Color.lerp(_colorLowest, _colorMedium, 0.5);
  final Color _colorMedium = Colors.yellow;
  Color? get _colorHigh => Color.lerp(_colorMedium, _colorHighest, 0.5);
  final Color _colorHighest = Colors.green;

  Color? getColorByLevel() {
    switch (level) {
      case 1:
        return _colorLowest;
      case 2:
        return _colorLow;
      case 3:
        return _colorMedium;
      case 4:
        return _colorHigh;
      case 5:
        return _colorHighest;
      default:
        return _colorHighest;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildSegments(),
    );
  }

  List<Widget> _buildSegments() {
    List<Widget> segments = [];
    for (int i = 0; i < 5; i++) {
      if (i < level) {
        segments.add(_buildSegment(getColorByLevel()));
      } else {
        segments.add(_buildSegment(Colors.transparent));
      }
    }
    return segments;
  }

  Widget _buildSegment(Color? color) {
    return Expanded(
      child: Container(
        height: 8,
        margin: kDefaultPadding / 4,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class SocialNetwork extends StatelessWidget {
  final AssetGenImage? icon;
  final double _iconSize = 24;
  final VoidCallback onTap;
  const SocialNetwork({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: kDefaultPadding / 2,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: icon?.image(width: _iconSize, height: _iconSize) ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
