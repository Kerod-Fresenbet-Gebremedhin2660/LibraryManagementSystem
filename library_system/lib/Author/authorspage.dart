import 'package:flutter/material.dart';
import 'package:library_system/Author/Autho_customcarduser.dart';
import 'package:library_system/export.dart';

class AuthorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
           actions: [
                IconButton(
                  icon: Icon(Icons.search,),
                  onPressed: () {
                    showSearch(context: context, delegate: AuthorSearch());
                  },
                ),

              ],
          title: Center(child:Text("Authors")),
          backgroundColor: fourthColor,
          ),
          body: Authusercontent(),
          ));
  }
}