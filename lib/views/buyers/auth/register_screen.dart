import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trade_x/controllers/auth_controller.dart';
import 'package:trade_x/utils/show_snackBar.dart';
import 'package:trade_x/views/buyers/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = AuthController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;

  late String fullName;

  late String phoneNumber;

  late String password;

  Uint8List ? _image;

  selectGalleryImage() async{
    Uint8List im = await _authController.pickProfileImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  selectCameraImage() async{
    Uint8List im = await _authController.pickProfileImage(ImageSource.camera);
    setState(() {
      _image = im;
    });
  }

  _signUpUser() async{
    if(_formKey.currentState!.validate()){
      await _authController.signUpUsers(
          email, fullName, phoneNumber, password, _image!).whenComplete((){
        setState((){
          _formKey.currentState!.reset();
        });
      });
      return showSnackB(context, 'Account created successfully');
    }else{
      return showSnackB(context, 'empty not allowed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create Customers Account',
                  style: TextStyle(fontSize: 20),
                ),
                Stack(
                  children: [
                    _image!=null? CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.yellow.shade900,
                    backgroundImage: MemoryImage(_image!),
                  ) : CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.yellow.shade900,
                      backgroundImage: NetworkImage('https://imgs.search.brave.com/Tcf04M1nEL7smn0aI01rQ1Mq44QnU5NPmNRV_wuvEIc/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAwLzY0LzY3LzYz/LzM2MF9GXzY0Njc2/MzgzX0xkYm1oaU5N/NllwemIzRk00UFB1/RlA5ckhlN3JpOEp1/LmpwZw'),
                    ),
                  Positioned(
                    right: 0,
                    top: 5,
                    child: IconButton(
                      onPressed:(){
                        selectGalleryImage();
                      } ,
                      icon:Icon(CupertinoIcons.photo),
                  ),
                  ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'email not be empty';
                      }else{
                        return null;
                      }
                    },
                    onChanged: (value){
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
                    validator: (value){
                      if(value!.isEmpty){
                        return 'email not be empty';
                      }else{
                        return null;
                      }
                    },
                    onChanged: (value){
                      fullName = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter Full Name'
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'email not be empty';
                      }else{
                        return null;
                      }
                    },
                    onChanged: (value){
                      phoneNumber = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter Phone Number'
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'password not be empty';
                      }else{
                        return null;
                      }
                    },
                    onChanged: (value){
                      password = value;
                    },
                    decoration: InputDecoration(
                        labelText: 'Password'
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    _signUpUser();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width -40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text('Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoginScreen();
                      },
                      ),
                      );
                    },
                        child: Text('Login'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
