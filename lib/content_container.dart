import 'package:flutter/material.dart';
import 'package:portfolio/ui/palette.dart';

class ContentContainer extends StatelessWidget {
  final Widget child;
  const ContentContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.containerColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: child),
        ],
      ),
    );
  }
}
