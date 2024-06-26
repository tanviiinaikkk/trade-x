import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class ShakeDetectorWidget extends StatefulWidget {
  const ShakeDetectorWidget({Key? key}) : super(key: key);

  @override
  _ShakeDetectorWidgetState createState() => _ShakeDetectorWidgetState();
}

class _ShakeDetectorWidgetState extends State<ShakeDetectorWidget> {
  static const List<String> quotes = [
  "Amazon started as a humble online bookstore in 1994 and now reigns as the global giant of ecommerce.",
  "eBay revolutionized online shopping with its auction-style listings and feedback system, fostering trust among users.",
  "Shopify empowers over 1.7 million businesses worldwide with its customizable platform and extensive app store.",
    "🎉🎉 Use code 'TRX10' to get 10% discount on your order 🎉🎉"
  ];

  String quote = quotes.first;
  ShakeDetector? detector;

  @override
  void initState() {
    super.initState();

    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        final newQuote = (List.of(quotes)
          ..remove(quote)
          ..shuffle())
            .first;

        setState(() {
          this.quote = newQuote;
        });
      },
    );
  }

  @override
  void dispose() {
    detector?.stopListening();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(48),
    child: Center(
      child: Text(
        quote,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
