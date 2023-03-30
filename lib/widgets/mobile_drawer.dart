import 'package:flutter/material.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
