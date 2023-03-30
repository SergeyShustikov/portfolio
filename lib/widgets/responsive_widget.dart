import 'package:flutter/material.dart';

const kMinMobileLayoutWidth = 600;
const kMinTabletLayoutWidth = 900;
const kMinDesktopLayoutWidth = 1100;

mixin LayoutTypeDeterminatorMixin on StatelessWidget {
  bool isDesktop(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > kMinDesktopLayoutWidth;
  }

  bool isTablet(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > kMinMobileLayoutWidth && screenWidth < kMinDesktopLayoutWidth;
  }

  bool isMobile(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < kMinTabletLayoutWidth;
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget desktopView;
  final Widget? tabletView;
  final Widget? mobileView;

  const ResponsiveWidget({
    super.key,
    required this.desktopView,
    this.tabletView,
    this.mobileView,
  });

  @override
  Widget build(BuildContext context) {
    Widget body = _getWidgetByScreenWidth(context);
    return body;
  }

  Widget _getWidgetByScreenWidth(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    debugPrint('Screen width has been changed = $screenWidth');
    if (screenWidth > kMinDesktopLayoutWidth) {
      return desktopView;
    } else if (screenWidth > kMinMobileLayoutWidth && screenWidth < kMinDesktopLayoutWidth) {
      return tabletView ?? desktopView;
    } else {
      return mobileView ?? tabletView ?? desktopView;
    }
  }
}
