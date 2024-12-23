import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/homeadmin.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/pembimbing/Homescreen.dart';
import 'package:flutter_application_1/peserta/homescreen.dart';
import 'package:flutter_application_1/register.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=> const SignInPage(),
      'regis': (context)=>const RegisterPage(),
      'homeAdmin': (context) => const HomeAdmin(),
      'homeOperator': (context) => const HomePage(),
      'homePeserta': (context) => const HomepagePeserta(),
     

    },
  ));
}



