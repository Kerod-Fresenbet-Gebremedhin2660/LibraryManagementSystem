import 'package:flutter/material.dart';
import 'package:library_ystem/constants.dart/constants.dart';

import '../navigation/navigation.dart';

class AuthorPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Center(child:Text("Authors")),
          backgroundColor: fourthColor,
          ),

      ),
    );
  }
}