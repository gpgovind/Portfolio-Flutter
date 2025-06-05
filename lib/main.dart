import 'package:flutter/material.dart';
import 'package:portfolio/app/core/app_theme.dart';
import 'package:toastification/toastification.dart';

import 'app/modules/home/view/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// final GlobalKey<NavigatorState> globalNavigatorKey =
//     GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: ToastificationConfig(
        marginBuilder: (context, alignment) =>
            const EdgeInsets.fromLTRB(0, 16, 0, 110),
      ),
      child: MaterialApp(
        //   navigatorKey: globalNavigatorKey,
        title: 'Portfolio',
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
