/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/apple_button.png
  AssetGenImage get appleButton =>
      const AssetGenImage('assets/images/apple_button.png');

  /// File path: assets/images/apple_google_button.png
  AssetGenImage get appleGoogleButton =>
      const AssetGenImage('assets/images/apple_google_button.png');

  /// File path: assets/images/avatar.jpg
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.jpg');

  /// File path: assets/images/avatar_small.jpg
  AssetGenImage get avatarSmall =>
      const AssetGenImage('assets/images/avatar_small.jpg');

  /// File path: assets/images/google_button.png
  AssetGenImage get googleButton =>
      const AssetGenImage('assets/images/google_button.png');

  /// File path: assets/images/header_photo.JPG
  AssetGenImage get headerPhoto =>
      const AssetGenImage('assets/images/header_photo.JPG');

  /// File path: assets/images/photo_main.JPG
  AssetGenImage get photoMain =>
      const AssetGenImage('assets/images/photo_main.JPG');

  /// List of all assets
  List<AssetGenImage> get values => [
        appleButton,
        appleGoogleButton,
        avatar,
        avatarSmall,
        googleButton,
        headerPhoto,
        photoMain
      ];
}

class $AssetsTechnologyIconsGen {
  const $AssetsTechnologyIconsGen();

  /// File path: assets/technology_icons/ic_amplitude.png
  AssetGenImage get icAmplitude =>
      const AssetGenImage('assets/technology_icons/ic_amplitude.png');

  /// File path: assets/technology_icons/ic_android.png
  AssetGenImage get icAndroid =>
      const AssetGenImage('assets/technology_icons/ic_android.png');

  /// File path: assets/technology_icons/ic_dart.png
  AssetGenImage get icDart =>
      const AssetGenImage('assets/technology_icons/ic_dart.png');

  /// File path: assets/technology_icons/ic_flutter.png
  AssetGenImage get icFlutter =>
      const AssetGenImage('assets/technology_icons/ic_flutter.png');

  /// File path: assets/technology_icons/ic_flutter_gen.jpeg
  AssetGenImage get icFlutterGen =>
      const AssetGenImage('assets/technology_icons/ic_flutter_gen.jpeg');

  /// File path: assets/technology_icons/ic_getx.png
  AssetGenImage get icGetx =>
      const AssetGenImage('assets/technology_icons/ic_getx.png');

  /// File path: assets/technology_icons/ic_github.png
  AssetGenImage get icGithub =>
      const AssetGenImage('assets/technology_icons/ic_github.png');

  /// File path: assets/technology_icons/ic_java.png
  AssetGenImage get icJava =>
      const AssetGenImage('assets/technology_icons/ic_java.png');

  /// File path: assets/technology_icons/ic_kotlin.png
  AssetGenImage get icKotlin =>
      const AssetGenImage('assets/technology_icons/ic_kotlin.png');

  /// File path: assets/technology_icons/ic_sentry.png
  AssetGenImage get icSentry =>
      const AssetGenImage('assets/technology_icons/ic_sentry.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        icAmplitude,
        icAndroid,
        icDart,
        icFlutter,
        icFlutterGen,
        icGetx,
        icGithub,
        icJava,
        icKotlin,
        icSentry
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTechnologyIconsGen technologyIcons =
      $AssetsTechnologyIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
