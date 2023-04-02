part of ui_library;

class ContentContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final EdgeInsetsGeometry? margin;

  final BoxConstraints? constraints;
  final double? width, height;

  const ContentContainer({
    super.key,
    this.child,
    this.padding,
    this.decoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      padding: padding,
      margin: margin,
      decoration: decoration,
      color: decoration == null ? Palette.containerColor : null,
      child: child != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: child!),
              ],
            )
          : null,
    );
  }
}
