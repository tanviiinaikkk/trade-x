import 'package:flutter/material.dart';
import 'package:trade_x/bio.dart';
import 'package:trade_x/views/buyers/auth/register_screen.dart';
import 'package:trade_x/views/buyers/main_screen.dart';
import 'package:trade_x/views/buyers/nav_screens/widgets/developer_widget.dart';

import '../../../controllers/auth_controller.dart';
import '../../../utils/show_snackBar.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  late String email;

  late String password;

  _loginUsers() async {
    if (_formKey.currentState!.validate()) {
      String res = await _authController.loginUsers(
          email, password);

      if (res == 'success') {
        return Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext context) {
          return MainScreen();
        })
        );
      }
      else {
        return showSnackB(context, 'fields empty');
      }
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login Customer Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email should not be empty';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter Email'
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    obscureText: true, // Set obscureText to true to show dots instead of text
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password not be empty';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter Password'
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    _loginUsers();
                  },
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Bio()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow.shade900),
                    ),
                    child: Text('Login using Fingerprint',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),),
                  ),

                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Need an Account'),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) {
                        return RegisterScreen();
                      },
                      ),
                      );
                    },
                      child: Text('Register'),
                    )
                  ],
                ),

                DeveloperText(),
              ],
            ),
          ),
        ),
      );
    }
  }


