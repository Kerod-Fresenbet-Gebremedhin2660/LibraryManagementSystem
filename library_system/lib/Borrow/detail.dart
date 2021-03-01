import 'package:flutter/material.dart';
import 'package:library_system/export.dart';

import 'borrowbooks.dart';

// ignore: must_be_immutable
class BorrowedDetail extends StatelessWidget {
  final Book book;
  BorrowedDetail({@required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              child: Image(
                  image: NetworkImage(
                      this.book.bookimage),
                  fit: BoxFit.fitHeight),
            ),
            SizedBox(
              height: 10,
            ),
            Column(children: <Widget>[
              Center(
                child: Text(
                  this.book.bookTitle,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Author:${this.book.authorid}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Category:${this.book.categoryid}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Published on:${this.book.publicationyear}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text("Time remaining:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(width: 30),
                  Time(),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 40),
                child: Text("Description",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(this.book.bookdesc,
                  style: TextStyle(fontSize: 17, color: twelfthColor)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: fourthColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BorroweBook(),
                ));
          },
          child: Text(
            "FINISHED",
            style: TextStyle(fontSize: 10),
          )),
    );
  }
}
