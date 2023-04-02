class Project {
  final String name;
  final String description;
  final String? image;
  final String? googlePlayLink;
  final String? appStoreLink;

  const Project({
    required this.name,
    required this.description,
    this.image,
    this.googlePlayLink,
    this.appStoreLink,
  });

  Uri getGooglePlayUri() => Uri.parse(googlePlayLink!);
  Uri getAppStoreUri() => Uri.parse(appStoreLink!);
}
