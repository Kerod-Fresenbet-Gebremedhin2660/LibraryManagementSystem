import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_ystem/Adminitrator/homepage.dart';
import 'package:library_ystem/authentication/login.dart';
import 'package:library_ystem/authentication/signup.dart';
import 'package:library_ystem/pages/homepage.dart';
import 'package:library_ystem/sidebar/menu_item.dart';

// import 'authentication/login.dart';
import 'constants.dart/constants.dart';
import 'navigation/navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.white),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
