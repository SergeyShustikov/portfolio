import 'package:flutter/material.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/utils/utils.dart';

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
