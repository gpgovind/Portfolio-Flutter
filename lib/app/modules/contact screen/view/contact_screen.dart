import 'package:flutter/material.dart';
import 'package:portfolio/app/core/app_color.dart';
import 'package:portfolio/app/modules/contact%20screen/widgets/custom_textfield.dart';
import 'package:portfolio/app/modules/contact%20screen/widgets/send_btn.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Responsive(
      mobile: _body(width),
      desktop: _body(width),
      tablet: _body(width),
    );
  }

  _body(double width) {
    return Container(
      color: AppColor.cardScreen,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: width / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            ''' Let's Works Together''',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
              ''' Have a project in mind? Let's discuss how i can help your business grow'''),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
              controller: TextEditingController(), hintText: 'Your Name'),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
              controller: TextEditingController(), hintText: 'Your Email'),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
              isMaxLin: true,
              controller: TextEditingController(),
              hintText: 'Your Email'),
          const SizedBox(
            height: 10,
          ),
          // Container(
          //   color: Colors.black,
          //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //   child: const Text(
          //     'Send Message',
          //     style: TextStyle(color: AppColor.appBackground),
          //   ),
          // ),
          CustomElevatedButton(
            onPressed: () {},
            text: 'Send Message',
          )
        ],
      ),
    );
  }
}
