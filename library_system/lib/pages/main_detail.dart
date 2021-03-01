import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/Borrow/bloc/bloc.dart';
import 'package:library_system/export.dart';

class MainDetail extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _Borrow = {};
  final Book book;
  MainDetail({@required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              child: Image(
                  image: NetworkImage(this.book.bookimage),
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
              ElevatedButton(
                child: Text("Already Read"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: fourthColor),
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
          onPressed: () {
            final form = _formKey.currentState;
            if (form.validate()) {
              form.save();
              final BorrowEvent event = BorrowBook(
                Borrow(
                  // isbnCode: this._Borrow["ISBN_Code"],
                  // bookTitle: this._Borrow["Book_Title"],
                  // categoryid: this._Borrow["Category_id"],
                  // authorid: this._Borrow["Author_id"],
                  // status: this._Borrow["status"],
                  // publicationyear: this._Borrow["Publication_year"],
                  actual_Return_Date: null, book_id: null, borrowed_TO: null,
                  borrowedfrom: null, issued_by: null, borrower_id: null,
                ),
              );
              BlocProvider.of<BorrowBookBloc>(context).add(event);
            }
          },
          child: Text(
            "BORROW",
            style: TextStyle(fontSize: 10),
          )),
    );
  }
}
