import 'package:flutter/material.dart';
import 'package:portfolio/app/core/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Govind P',
                      style: TextStyle(color: AppColor.appBlk),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Home',
                    ),
                    Text(
                      'Work',
                    ),
                    Text(
                      'About',
                    ),
                    Text(
                      'Contact',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: AppColor.lightGrey,
                )
              ],
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
