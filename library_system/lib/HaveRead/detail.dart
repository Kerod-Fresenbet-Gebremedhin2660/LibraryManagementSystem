import 'package:flutter/material.dart';
import 'package:library_system/export.dart';

// ignore: must_be_immutable
class HaveReadDetail extends StatelessWidget {
    final Book book;
  HaveReadDetail({@required this.book});
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
                width: 50,
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
          onPressed: () {},
          child: Text(
            "BORROW          AGAIN",
            style: TextStyle(fontSize: 10),
          )),
    );
  }
}
