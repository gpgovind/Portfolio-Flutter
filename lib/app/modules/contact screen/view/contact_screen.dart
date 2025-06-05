import 'package:flutter/material.dart';
import 'package:portfolio/app/modules/contact%20screen/controller/contact_screen_controller.dart';
import 'package:portfolio/app/modules/contact%20screen/widgets/custom_textfield.dart';
import 'package:portfolio/app/modules/contact%20screen/widgets/send_btn.dart';
import 'package:portfolio/app/utils/app_toast_message.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final messageTextController = TextEditingController();

  bool isSending = false;

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    messageTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Responsive(
      mobile: _body(width, colorScheme),
      desktop: _body(width, colorScheme),
      tablet: _body(width, colorScheme, true),
    );
  }

  Widget _body(double width, ColorScheme colorScheme, [bool isTablet = false]) {
    return Container(
      color: colorScheme.surface.withOpacity(.3),
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: width < 600
            ? 20
            : isTablet
                ? width / 6
                : width / 3,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Let's Work Together",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Have a project in mind? Let's discuss how I can help your business grow.",
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.onSurface.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: nameTextController,
            hintText: 'Your Name',
          ),
          const SizedBox(height: 10),
          CustomTextField(
            controller: emailTextController,
            hintText: 'Your Email',
          ),
          const SizedBox(height: 10),
          CustomTextField(
            isMaxLin: true,
            controller: messageTextController,
            hintText: 'Your Message',
          ),
          const SizedBox(height: 20),
          isSending
              ? CircularProgressIndicator()
              : CustomElevatedButton(
                  onPressed: () {
                    setState(() => isSending = true);
                    final name = nameTextController.text;
                    final email = emailTextController.text;
                    final message = messageTextController.text;

                    if (name.isNotEmpty &&
                        email.isNotEmpty &&
                        message.isNotEmpty) {
                      ContactScreenController.sendFormMessage(
                              name: name, email: email, message: message)
                          .then((success) {
                        if (success) {
                          nameTextController.clear();
                          emailTextController.clear();
                          messageTextController.clear();
                          setState(() => isSending = false);
                        } else {
                          setState(() => isSending = false);
                        }
                      });
                    } else {
                      APPToastMessage.shoW("Fill Form to send mail", true);
                      setState(() => isSending = false);
                    }
                  },
                  text: 'Send Message',
                ),
        ],
      ),
    );
  }
}
