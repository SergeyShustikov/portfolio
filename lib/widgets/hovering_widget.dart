part of ui_library;

class HoveringWidget extends StatefulWidget {
  final Widget child;
  const HoveringWidget({super.key, required this.child});

  @override
  State<HoveringWidget> createState() => _HoveringWidgetState();
}

class _HoveringWidgetState extends State<HoveringWidget> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) => setState(() {
              _hovering = true;
            }),
        onExit: (event) => setState(() {
              _hovering = false;
            }),
        cursor: _hovering ? SystemMouseCursors.click : SystemMouseCursors.none,
        child: widget.child);
  }
}
