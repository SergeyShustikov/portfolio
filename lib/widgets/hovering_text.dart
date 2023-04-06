part of ui_library;

class HoveringText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final VoidCallback onTap;
  final bool noHover;
  final bool underline;
  const HoveringText(
    this.text, {
    super.key,
    required this.onTap,
    this.style,
    this.noHover = false,
    this.underline = true,
  });

  @override
  State<HoveringText> createState() => _HoveringTextState();
}

class _HoveringTextState extends State<HoveringText> {
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
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: widget.noHover || !widget.underline
                  ? const BoxDecoration()
                  : BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _hovering ? Colors.white : Palette.containerColor,
                          width: 2,
                        ),
                      ),
                    ),
              child: TextHeader(
                widget.text,
                style: widget.style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
