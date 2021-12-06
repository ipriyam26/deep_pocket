// ignore_for_file: avoid_print, camel_case_types

import 'package:url_launcher/url_launcher.dart';

class clubUtils {
  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('failure');
    }
  }

  static openEmail(
      {required String toEmail,
      required String subject,
      required String body}) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';
    await _launchUrl(url);
  }
}
