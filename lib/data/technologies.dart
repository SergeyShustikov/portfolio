// ignore_for_file: constant_identifier_names

import 'package:portfolio/gen/assets.gen.dart';

enum Technology {
  amplitude('Amplitude'),
  android('Android'),
  getX('GetX'),
  flutter_gen('flutter_gen'),
  flutter('Flutter'),
  dart('Dart'),
  sentry('Sentry'),
  java('Java'),
  kotlin('Kotlin'),
  github('GitHub'),
  ;

  final String title;

  const Technology(this.title);

  static Technology? findTechnologyByString(String title) {
    for (var technology in Technology.values) {
      if (technology.title.toLowerCase() == title.toLowerCase()) {
        return technology;
      }
    }
    return null;
  }
}

extension TecnologyExtension on Technology {
  AssetGenImage? get icon {
    switch (this) {
      case Technology.android:
        return Assets.technologyIcons.icAndroid;
      case Technology.getX:
        return Assets.technologyIcons.icGetx;
      case Technology.flutter_gen:
        return Assets.technologyIcons.icFlutterGen;
      case Technology.flutter:
        return Assets.technologyIcons.icFlutter;
      case Technology.sentry:
        return Assets.technologyIcons.icSentry;
      case Technology.amplitude:
        return Assets.technologyIcons.icAmplitude;
      case Technology.dart:
        return Assets.technologyIcons.icDart;
      case Technology.java:
        return Assets.technologyIcons.icJava;
      case Technology.kotlin:
        return Assets.technologyIcons.icKotlin;
      case Technology.github:
        return Assets.technologyIcons.icGithub;
    }
  }
}
