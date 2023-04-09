part of 'utils.dart';

void sendEmail() {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'pandarium.shustikov@gmail.com',
    queryParameters: {'subject': '', 'body': ''},
  );
  launchUrl(emailLaunchUri, mode: LaunchMode.platformDefault);
}

void openLink(BuildContext context, String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Could not launch url'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
