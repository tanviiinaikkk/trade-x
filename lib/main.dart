// import 'package:flutter/material.dart';
// import 'package:trade_x/views/buyers/main_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//         fontFamily: 'Brand-Bold',
//       ),
//       home: MainScreen(),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_x/views/buyers/main_screen.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Brand-Bold',
      ),
      home: AnimatedSplashScreen(
        logoImagePath: 'assets/icons/explore.svg',
        mainScreen: MainScreen(),
      ),
    );
  }
}

class AnimatedSplashScreen extends StatefulWidget {
  final Widget mainScreen;
  final String logoImagePath;

  const AnimatedSplashScreen({
    Key? key,
    required this.mainScreen,
    required this.logoImagePath,
  }) : super(key: key);

  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => widget.mainScreen),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: 1 + (_animation.value * 0.5), // Scale from 1 to 1.5
            child: Center(
              child: Opacity(
                opacity: 1 - _animation.value,
                child: Image.asset(
                  widget.logoImagePath,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
