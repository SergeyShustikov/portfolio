import 'package:flutter/material.dart';
import 'package:portfolio/app_bar.dart';
import 'package:portfolio/content_container.dart';
import 'package:portfolio/footer.dart';

const kMinMobileLayoutWidth = 600;
const kMinTabletLayoutWidth = 1000;
const kMinDesktopLayoutWidth = 1400;

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
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(72),
          child: Center(
              child: Column(
            children: const [
              SiteAppBar(),
            ],
          ))),
      body: SizedBox.expand(child: body),
    );
  }

  Widget _getWidgetByScreenWidth(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > kMinDesktopLayoutWidth) {
      return desktopView;
    } else if (screenWidth > kMinMobileLayoutWidth && screenWidth < kMinDesktopLayoutWidth) {
      return tabletView ?? desktopView;
    } else {
      return mobileView ?? tabletView ?? desktopView;
    }
  }
}

class WebsiteCarcase extends StatelessWidget {
  final Widget body;

  const WebsiteCarcase({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopView: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 8),
                Flexible(child: ContentContainer(child: body)),
                // const Spacer(),
                const SiteFooter(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      tabletView: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 8),
              Flexible(child: ContentContainer(child: body)),
              // const Spacer(),
              const SiteFooter(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
