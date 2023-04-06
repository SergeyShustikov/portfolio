part of ui_library;

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Palette.backgroundColor,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Column(
        children: [
          ContentContainer(
            height: kToolbarHeight + 14,
            child: Center(child: Text('Go to :', style: kHeaderTextStyleBold)),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          Container(
            color: Palette.backgroundColor,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text('About me'),
                  onTap: () {
                    context.go('/about');
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Projects'),
                  onTap: () {
                    context.go('/projects');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
