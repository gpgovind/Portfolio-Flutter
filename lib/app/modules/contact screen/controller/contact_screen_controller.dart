import 'dart:convert';
import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:portfolio/app/utils/app_links.dart';
import 'package:portfolio/app/utils/app_toast_message.dart';

class ContactScreenController {
  static Future<bool> sendFormMessage({
    required String name,
    required String email,
    required String message,
  }) async {
    final url = Uri.parse(AppLinks.formSheetId);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      APPToastMessage.shoW("Message sent successfully!", false);
      return true;
    } else {
      APPToastMessage.shoW(
          "Failed to send message. Please try again later.", true);

      log("Failed to send: ${response.body}");

      return false;
    }
  }
}
