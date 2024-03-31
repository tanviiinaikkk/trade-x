import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:trade_x/views/buyers/nav_screens/store_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Razorpay _razorpay = Razorpay();
  List<int> quantities = [];

  String deliveryInstructions = '';
  String address = '';

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    // Initialize quantities list with default quantity as 1 for each item
    quantities = List<int>.filled(widget.cartItems.length, 1);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
      msg: "SUCCESS PAYMENT: ${response.paymentId}",
      timeInSecForIosWeb: 4,
    );

    setState(() {
      quantities.clear();
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "ERROR HERE: ${response.code} - ${response.message}",
      timeInSecForIosWeb: 4,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET IS : ${response.walletName}",
      timeInSecForIosWeb: 4,
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = _calculateTotalAmount();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                double itemTotal =
                    widget.cartItems[index].price * quantities[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      widget.cartItems[index].name,
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${widget.cartItems[index].price.toStringAsFixed(2)} each',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Total: \$${itemTotal.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (quantities[index] > 1) {
                                quantities[index]--;
                              }
                            });
                          },
                        ),
                        Text(
                          '${quantities[index]}',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              quantities[index]++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Overall Total: \$${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Delivery Instructions:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      deliveryInstructions = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Add delivery instructions (optional)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _addAddress,
                  child: Text(
                    'Add Address using GPS',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Current Address: $address',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement logic to proceed to payment
                _openCheckout();
              },
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateTotalAmount() {
    double totalAmount = 0.0;
    for (int i = 0; i < widget.cartItems.length; i++) {
      totalAmount += widget.cartItems[i].price * quantities[i];
    }
    return totalAmount;
  }

  void _openCheckout() {
    double totalAmount = _calculateTotalAmount();

    var options = {
      'key': 'rzp_test_juCmOKhl8Noq5l', // Replace with your Razorpay key
      'amount': (totalAmount * 100).toInt(), // Convert to paise/cents
      'name': 'TradeX',
      'description': 'Payment for Products',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: ${e.toString()}');
    }
  }

  void _addAddress() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        setState(() {
          address = (placemark.street ?? '') +
              (placemark.subLocality != null ? ', ${placemark.subLocality}' : '') +
              ', ${placemark.locality ?? ''}' +
              ', ${placemark.administrativeArea ?? ''}' +
              ', ${placemark.country ?? ''}';
        });
      } else {
        setState(() {
          address = 'Address not found';
        });
      }
    } else {
      Fluttertoast.showToast(
        msg: "Location permission denied",
        timeInSecForIosWeb: 4,
      );
    }
  }

}
