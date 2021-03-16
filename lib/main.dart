import 'package:flutter/material.dart';
import 'package:sg_mart/login&signin/login.dart';
import 'package:sg_mart/login&signin/new_account.dart';
import 'package:sg_mart/screen/landing_page.dart';
import 'package:sg_mart/screen/pages/about.dart';
import 'package:sg_mart/screen/pages/start_a_business.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(brightness:Brightness.dark,),
      debugShowCheckedModeBanner: false,
      title: 'SG Mart',
      home: Login(),
      // home: Business(),
      // home: About(),
      // home: Signup(),
    );
  }
}
