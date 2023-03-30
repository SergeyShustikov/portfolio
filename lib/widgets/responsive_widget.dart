import 'package:flutter/material.dart';

const kMinMobileLayoutWidth = 580;
const kMinTabletLayoutWidth = 860;
const kMinDesktopLayoutWidth = 1200;
mixin LayoutTypeDeterminatorMixin on StatelessWidget {
  bool isDesktop(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth >= kMinDesktopLayoutWidth;
  }

  bool isTablet(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > kMinTabletLayoutWidth && screenWidth < kMinDesktopLayoutWidth;
  }

  bool isMobile(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth <= kMinTabletLayoutWidth;
  }
}

class ResponsiveWidget extends StatelessWidget with LayoutTypeDeterminatorMixin {
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
    if (isDesktop(context)) {
      return desktopView;
    } else if (isTablet(context)) {
      return tabletView ?? desktopView;
    } else {
      return mobileView ?? tabletView ?? desktopView;
    }
  }
}
