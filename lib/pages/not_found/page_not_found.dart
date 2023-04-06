import 'package:flutter/material.dart';
import 'package:portfolio/utils/text_styles.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Page Not Found',
          style: kPageNotFoundTitleStyle,
        ),
      ),
    );
  }
}
