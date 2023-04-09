import 'package:flutter/material.dart';
import 'package:portfolio/data/technologies.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/theming/palette.dart';
import 'package:portfolio/utils/text_styles.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/buttons/social_network.dart';

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
                onTap: () => sendEmail(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
