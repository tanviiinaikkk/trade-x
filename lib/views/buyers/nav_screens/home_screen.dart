import 'package:flutter/material.dart';
import 'package:trade_x/qr_code_scanner.dart';
import 'package:trade_x/shake_detector.dart';
import 'package:trade_x/views/buyers/ecomm.dart';
import 'package:trade_x/views/buyers/nav_screens/widgets/banner_widget.dart';
import 'package:trade_x/views/buyers/nav_screens/widgets/categorytext.dart';
import 'package:trade_x/views/buyers/nav_screens/widgets/developer_widget.dart';
import 'package:trade_x/views/buyers/nav_screens/widgets/search_input_widget.dart';
import 'package:trade_x/views/buyers/nav_screens/widgets/welcome_text_widget.dart';


 // Import QRScannerScreen class

class HomeScreen extends StatefulWidget {
  @override
   _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({Key key}) : super(key: key); // Fixed super(key) constructor call
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(),
            SizedBox(
              height: 14,
            ),
            SearchInput(),
            BannerWidget(),
            CategoryText(),
            SizedBox(
              height: 20,
            ),
        
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRScannerScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade900),
                ),
                child: Text('Scan QR',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),),
              ),
        
            ),
        
            SizedBox( height: 20,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShakeDetectorWidget()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade900),
                ),
                child: Text('Click & Shake for Surprise',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),
              ),
        
            ),

            DeveloperText(),

            // SizedBox( height: 20,),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => EcommercePage()),
            //       );
            //     },
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade900),
            //     ),
            //     child: Text('demo',
            //       style: TextStyle(
            //         fontSize: 18,
            //         color: Colors.white,
            //       ),),
            //   ),
            //
            // ),
        
        
        
          ],
        ),
      ),
    );
  }
}
