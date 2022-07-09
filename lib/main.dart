import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pokedex/commons/const/app_constants.dart';
import 'package:pokedex/commons/routes/AppRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.texts.title,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: AnimatedSplashScreen(
            splash: 'assets/images/splash.png',
            nextScreen: const AppRoutes(),
            splashTransition: SplashTransition.rotationTransition,
            pageTransitionType: PageTransitionType.theme,
            duration: 3000,
            backgroundColor: Colors.white));
  }
}
