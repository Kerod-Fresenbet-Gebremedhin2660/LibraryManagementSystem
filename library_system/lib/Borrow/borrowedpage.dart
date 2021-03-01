import 'package:flutter/material.dart';
import 'package:library_system/books/booksearch.dart';
import 'package:library_system/export.dart';


class BorrowedPage extends StatelessWidget {
  //final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    showSearch(context: context, delegate: MainBookSearch());
                  },
                ),
              ],
          title: Center(child:Text("Borrowed Books")),
          backgroundColor: fourthColor,
          ),
      body:BorrowedContent()
      ),
    );
  }
}
