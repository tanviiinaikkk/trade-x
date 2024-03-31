import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trade_x/firebase_options.dart';
import 'package:trade_x/views/buyers/auth/register_screen.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// import 'package:trade_x/views/buyers/main_screen.dart';
import 'dart:async';

import 'package:trade_x/views/buyers/nav_screens/widgets/developer_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Brand-Bold',
      ),
      home: AnimatedSplashScreen(
        logoImagePath: 'assets/logo1.png',
        mainScreen: RegisterScreen(),
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

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.repeat(reverse: true);

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
      body: Stack(
        children: [
          Center(
            child: RotationTransition(
              turns: _animation,
              child: ScaleTransition(
                scale: _animation,
                child: Opacity(
                  opacity: 1 - _animation.value,
                  child: Image.asset(
                    widget.logoImagePath,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(
              "TradeX Ecommerce",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow.shade900,
              ),
            ),
          ),

          DeveloperText(),
        ],
      ),
    );
  }
}
