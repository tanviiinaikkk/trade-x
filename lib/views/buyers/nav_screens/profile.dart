import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              'Tanvi', // Replace with actual user's name
              style: TextStyle(fontSize: 16, color: Colors.yellow),
            ),
            SizedBox(height: 30),
            Text(
              'Email:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              'naik.tanvi963@gmail.com', // Replace with actual user's email
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Text(
              'Phone Number:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              '9372737475', // Replace with actual user's phone number
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
