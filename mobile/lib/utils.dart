import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

formatDate(DateTime? date) {
  if (date == null) {
    return "- - -";
  }
  final formatter = DateFormat("dd MMMM yyyy");
  return formatter.format(date);
}

openUrl(String url) async {
  final Uri httpsUri = Uri.parse(url);
  if (await canLaunchUrl(httpsUri)) {
    launchUrl(httpsUri);
  } else {
    print("Failed to open URL");
    throw 'Could not launch $url';
  }
}