// bio.dart

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:trade_x/views/buyers/nav_screens/home_screen.dart';

class Bio extends StatefulWidget {
  @override
  State<Bio> createState() => _BioState();
}

class _BioState extends State<Bio> {
  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = false;
  List<BiometricType> _availableBiometric = [];

  String authorized = "Not authorized";

  // Checking biometrics
  Future<void> _checkBiometric() async {
    late bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      canCheckBiometric = false;
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  // Getting all available biometrics
  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
      availableBiometric = [];
    }
    if (!mounted) return;

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  // Authenticating using biometrics
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: "Scan your finger print to authenticate",
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      authorized = authenticated ? "Authorized success" : "Failed to authenticate";
    });

    if (authenticated) {
      // Navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkBiometric();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                ElevatedButton(
                  onPressed: _authenticate,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Get Biometric",
                      style: TextStyle(fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade900,
                  minimumSize: Size(200, 50),), // Adjust width and height as needed
                ),

              // Text("Can check biometric: $_canCheckBiometric"),
              // Text("Available biometric: $_availableBiometric"),
              // Text("Current State: $authorized"),
            ],
          ),
        ),
      ),
    );
  }
}
