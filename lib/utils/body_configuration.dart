part of 'ui_utils.dart';

BodyConfiguration getBodyConfiguration(BuildContext context) {
  if (context.isDesktop()) {
    return const BodyConfiguration([
      FlexPart(),
      BodyPart(flex: 4),
      FlexPart(),
    ]);
  } else {
    return const BodyConfiguration([
      BodyPart(),
    ]);
  }
}
