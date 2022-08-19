import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Future<String> CreateSharingDynamicLink(String slug) async {
  final dynamicLinkParams = DynamicLinkParameters(
    link: Uri.parse("https://www.example.com/"),
    uriPrefix: "https://example.page.link",
    androidParameters:
        const AndroidParameters(packageName: "com.example.app.android"),
    iosParameters: const IOSParameters(bundleId: "com.example.app.ios"),
  );
  final dynamicLink =
      await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);

  return 'https://cheesemovie.page.link/$slug';
}
