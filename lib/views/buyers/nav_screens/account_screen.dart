import 'package:flutter/material.dart';
import 'package:trade_x/views/buyers/nav_screens/home_screen.dart';
 // Import the ThemeAccountScreen

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.yellow.shade900, // Use the theme color for the app bar
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Profile Settings'),
            leading:  Icon(Icons.person, color: Colors.yellow.shade900), // Use theme color for the icon
            onTap: () {
              // Handle tapping on profile settings
            },
          ),
          ListTile(
            title: const Text('Notification Preferences'),
            leading:  Icon(Icons.notifications_active, color: Colors.yellow.shade900), // Use theme color for the icon
            onTap: () {
              // Handle tapping on notification preferences
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            leading:  Icon(Icons.privacy_tip, color: Colors.yellow.shade900), // Use theme color for the icon
            onTap: () {
              // Handle tapping on privacy policy
            },
          ),
          ListTile(
            title: const Text('Change Theme'),
            leading:  Icon(Icons.color_lens, color: Colors.yellow.shade900), // Use theme color for the icon
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
        ],
      ),
    );


  }
}