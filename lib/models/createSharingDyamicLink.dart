import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Future<String> CreateSharingDynamicLink(String slug) async {
  final dynamicLinkParams = DynamicLinkParameters(
    link: Uri.parse("https://cheesemovie.page.link/$slug"),
    uriPrefix: "https://cheesemovie.page.link",
    androidParameters: const AndroidParameters(packageName: "com.example.cheese_movie"),
    iosParameters:
    IOSParameters(bundleId: "cheese_movie"),
  );
  final dynamicLink =
      await FirebaseDynamicLinks.instance.buildLink(dynamicLinkParams);
  return dynamicLink.toString();
}
