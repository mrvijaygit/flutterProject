import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash : Column(
        children: [
          Expanded(
            child: Image.asset(
                'assets/img/logo.png'),
          ),
          const Expanded(
            child: Text('WELCOME',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
      nextScreen: const MyHomePage(),
      duration: 1500,
      splashTransition: SplashTransition.slideTransition,
    );
  }
}

