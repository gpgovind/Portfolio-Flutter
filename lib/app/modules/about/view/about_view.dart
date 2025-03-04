import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/app_links.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: _bodyMobile(),
      ),
      desktop: Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 100, bottom: 40, right: 20),
        child: _body(),
      ),
      tablet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: _body(),
      ),
    );
  }

  _body() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.network(AppLinks.developer),
        const Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                ''' With 1 year of experience in Flutter development and design, \n I help businesses create impactful mobile solutions that drive results. '''),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.web),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Web Development'),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.design_services),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Ui/Ux Design'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.phone_iphone),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Mobile Development'),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.storage),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Backend Development'),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  _bodyMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.network(AppLinks.developer),
        const Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                ''' With 1 year of experience in Flutter development and design, \n I help businesses create impactful mobile solutions that drive results. '''),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.web),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Web Development'),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.design_services),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Ui/Ux Design'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.phone_iphone),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Mobile Development'),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.storage),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Backend Development'),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
