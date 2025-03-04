import 'package:flutter/material.dart';
import 'package:portfolio/app/core/app_color.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Govind p',
                style: TextStyle(color: AppColor.appBackground),
              ),
              Row(
                children: [
                  Icon(
                    Icons.linked_camera_outlined,
                    color: AppColor.appBackground,
                  ),
                  Icon(
                    Icons.gite,
                    color: AppColor.appBackground,
                  )
                ],
              )
            ],
          ),
          Text(
            '@ Govind p 2025 All rights reserved',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
