import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:language_translator/homepage.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSplashScreen(
       duration: 1950,
          splash: Image.asset("Assets/language-translation-icon-free-vector-removebg-preview.png"), 
          nextScreen: HomePage(),
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: const Color.fromARGB(255, 216, 235, 249),
          splashIconSize: MediaQuery.of(context).size.width * 1.0, 
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 220, // adjust as per your requirement
          child: Text(
            "Lingify",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 3, 94, 168),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.none
            ),
          ),
        ),
        // Positioned(
        //   left: 0,
        //   right: 0,
        //   bottom: 600, // adjust as per your requirement
        //   child: Image.asset("Assets/blure_curve-removebg-preview.png")
        // ),
      ],
    );
  }
}
