import 'package:flutter/material.dart';
import 'package:flutter_application_1/pembimbing/Homescreen.dart';
import 'package:flutter_application_1/pembimbing/login.dart';
import 'package:flutter_application_1/pembimbing/register.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=>SignInPage(),
      'regis': (context)=>RegisterPage(),
      'homescreen': (context)=>const Homescreen(),
      
    },
  ));
}



