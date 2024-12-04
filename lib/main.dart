import 'package:flutter/material.dart';
import 'package:flutter_application_1/pembimbing/Homescreen.dart';
import 'package:flutter_application_1/pembimbing/list_pembimbing.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/register.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=> const SignInPage(),
      'regis': (context)=>const RegisterPage(),
      'homescreen': (context)=>const HomePage(),
      'listpembimbing': (context)=> const ListBimbinganPage(),
      
    },
  ));
}



