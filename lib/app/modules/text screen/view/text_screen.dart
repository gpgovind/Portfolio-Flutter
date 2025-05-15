import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/app/modules/text%20screen/widgets/custom_btn.dart';
import 'package:portfolio/app/utils/app_links.dart';
import 'package:portfolio/app/utils/responsive_helper.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Responsive(
      tablet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: _textBody(colorScheme),
      ),
      desktop: Padding(
        padding: const EdgeInsets.only(top: 40, left: 230, bottom: 40),
        child: _textBody(colorScheme),
      ),
      mobile: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: _textBodyMobile(colorScheme),
      ),
    );
  }

  Widget _textBody(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    '''Hi I'm Govind  ''',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: colorScheme.onSurface, // Dynamic title color
                    ),
                  ),
            
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontFamily: 'Horizon',
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText('Mobile App Enthusiast'),
                        TyperAnimatedText('Flutter Developer'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.9),
                  ),
                  children: const [
                    TextSpan(
                      text: 'Building ',
                    ),
                    TextSpan(
                      text: 'high-performance, cross-platform applications ',
                      style: TextStyle(
                   
                      ),
                    ),
                    TextSpan(
                      text: 'with clean, ',
                    ),
                    TextSpan(
                      text: 'user-focused interfaces ',
                      style: TextStyle(
             
                      ),
                    ),
                    TextSpan(
                      text: 'and ',
                    ),
                    TextSpan(
                      text: 'scalable architecture.',
                      style: TextStyle(
            
                      ),
                    ),
                    TextSpan(
                      text: ' Specializing in Flutter to deliver ',
                    ),
                    TextSpan(
                      text: 'seamless, high-quality experiences ',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: 'across mobile and web platforms.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const CustomBtn(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.transparent,
              // backgroundImage: AssetImage('assets/gif/capture.gif'),
              child: Stack(
                children: [
                  Lottie.asset(
                    AppLinks.profileBK,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Image.asset(
                      AppLinks.profile,
                    ),
                  )
                ],
              )),
        ),
        const Spacer()
      ],
    );
  }
  Widget _textBodyMobile(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

              Padding(
          padding: const EdgeInsets.only(left: 40),
          child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.transparent,
              // backgroundImage: AssetImage('assets/gif/capture.gif'),
              child: Stack(
                children: [
                  Lottie.asset(
                    AppLinks.profileBK,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Image.asset(
                      AppLinks.profile,
                    ),
                  )
                ],
              )),
        ),
        const SizedBox(height: 40),
        Column(
          children: [
            Text(
              '''Hi I'm Govind  ''',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 38,
                color: colorScheme.onSurface, // Dynamic title color
              ),
            ),
      
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontFamily: 'Horizon',
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText('Mobile App Enthusiast'),
                  TyperAnimatedText('Flutter Developer'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 18,
              height: 1.6,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.9),
            ),
            children: const [
              TextSpan(
                text: 'Building ',
              ),
              TextSpan(
                text: 'high-performance, cross-platform applications ',
                style: TextStyle(
             
                ),
              ),
              TextSpan(
                text: 'with clean, ',
              ),
              TextSpan(
                text: 'user-focused interfaces ',
                style: TextStyle(
       
                ),
              ),
              TextSpan(
                text: 'and ',
              ),
              TextSpan(
                text: 'scalable architecture.',
                style: TextStyle(
      
                ),
              ),
              TextSpan(
                text: ' Specializing in Flutter to deliver ',
              ),
              TextSpan(
                text: 'seamless, high-quality experiences ',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                text: 'across mobile and web platforms.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const CustomBtn(),
      ],
    );
  }
}
