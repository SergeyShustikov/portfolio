part of ui_library;

class TextHeader extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const TextHeader(
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? _headerStyle,
    );
  }

  TextStyle get _headerStyle => kNormalTextStyle.copyWith(color: const Color(0xffE8EAED));
}
