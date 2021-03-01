import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/Borrow/bloc/bloc.dart';
import 'package:library_system/books/blocs/bookEvent.dart';
import 'package:library_system/books/models/books.dart';
import 'package:library_system/export.dart';

class BorroweBook extends StatefulWidget {
  static const routeName = 'BookAddUpdate';


  @override
  _BorroweBookState createState() => _BorroweBookState();
}

class _BorroweBookState extends State<BorroweBook> {
  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  final Map<String, dynamic> _Book = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fourthColor,
        title: Text(
          'Borrow Book',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter borrower_id';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Borrower'),
                  onSaved: (value) {
                    setState(() {
                      this._Book["Borrower_id"] = int.parse(value);
                    });
                  }),
              TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Borrower to';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Borrower to'),
                  onSaved: (value) {
                    this._Book["Borrowed_TO"] = value;
                  }),
              TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter borrowed from';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Book from'),
                  onSaved: (value) {
                    this._Book["Borrowed_From"] = value;
                  }),
                TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Actual_Return_Date';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Book Actual_Return_Date'),
                  onSaved: (value) {
                    this._Book["Actual_Return_Date"] = int.parse(value);
                  }),
              TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Issued_by';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Issued_by'),
                  onSaved: (value) {
                    setState(() {
                      this._Book["Issued_by"] = value;
                    });
                  }),
              TextFormField(
                  initialValue: '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Book_id';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Book_id'),
                  onSaved: (value) {
                    setState(() {
                      this._Book["Book_id"] = int.parse(value);
                    });
                  }),
              
                  
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: fourthColor),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      final BorrowEvent event = 
                      BorrowBook(
                              Borrow(
                                borrower_id: this._Book['Borrower_id'],
                                actual_Return_Date: this._Book["Actual_Return_Date"], 
                                book_id: this._Book["Book_id"], 
                                borrowed_TO: this._Book["Borrowed_TO"], 
                                borrowedfrom: this._Book["Borrowed_From"], 
                                issued_by: this._Book["Issued_by"]
                                // isbnCode: this._Book["ISBN_Code"],
                                // bookTitle: this._Book["Book_Title"],
                                // bookimage: this._Book["Book_image"],
                                // bookdesc: this._Book["Book_desc"],
                                // categoryid: this._Book["Category_id"],
                                // authorid: this._Book["Author_id"],
                                // status: this._Book["status"],
                                // publicationyear: this._Book["Publication_year"],
                              ),
                            );
                      BlocProvider.of<BorrowBookBloc>(context).add(event);
                      Navigator.pushNamedAndRemoveUntil(context,
                          AdminBookContent.routeName, (route) => false);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
