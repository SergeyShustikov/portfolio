import 'package:flutter/material.dart';
import 'package:portfolio/gen/assets.gen.dart';

class MyAvatar extends StatelessWidget {
  final double dimension;
  const MyAvatar({
    super.key,
    this.dimension = 144,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: CircleAvatar(
        backgroundImage: AssetImage(Assets.images.avatarSmall.path),
      ),
    );
  }
}
