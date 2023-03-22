import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

const kMinMobileLayoutWidth = 600;
const kMinTabletLayoutWidth = 1200;
const kMinDesktopLayoutWidth = 1600;

class WebsiteCarcase extends StatefulWidget {
  const WebsiteCarcase({super.key});

  @override
  State<WebsiteCarcase> createState() => _WebsiteCarcaseState();
}

class _WebsiteCarcaseState extends State<WebsiteCarcase> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
