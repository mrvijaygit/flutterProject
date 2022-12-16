import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/provider/product_provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:test/screens/home_screen.dart';
import 'package:test/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => ProductProvider())
        ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      )
    );
  }
}

