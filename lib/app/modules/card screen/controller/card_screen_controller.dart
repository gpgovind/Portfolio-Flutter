import 'package:portfolio/app/utils/app_links.dart';
import 'package:url_launcher/url_launcher.dart';

class CardScreenController {
  static final Uri _pixelsxLink = Uri.parse(AppLinks.pixelsxLink);
  static final Uri _mediWaterLink = Uri.parse(AppLinks.mediWaterLink);
  static final List<Function> links = [
    _openPixelsX,
    _openMediWater,
    _openTodo,
  ];

  static Future<void> _openPixelsX() async {
    if (!await launchUrl(_pixelsxLink)) {
      throw Exception('Could not launch $_pixelsxLink');
    }
  }

  static Future<void> _openMediWater() async {
    if (!await launchUrl(_mediWaterLink)) {
      throw Exception('Could not launch $_mediWaterLink');
    }
  }

  static Future<void> _openTodo() async {}
}
