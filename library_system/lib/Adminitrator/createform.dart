import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/books/blocs/bookEvent.dart';
import 'package:library_system/books/models/books.dart';
import 'package:library_system/export.dart';

class AddUpdateBook extends StatefulWidget {
  static const routeName = 'BookAddUpdate';
  final BookArgument args;

  const AddUpdateBook({this.args});

  @override
  _AddUpdateBookState createState() => _AddUpdateBookState();
}

class _AddUpdateBookState extends State<AddUpdateBook> {
  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  final Map<String, dynamic> _Book = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fourthColor,
        title: Text(
          '${widget.args.edit ? "Edit Book" : "Add New Book"}',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.book.isbnCode.toString() : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter isbn code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'isbn Code'),
                  onSaved: (value) {
                    setState(() {
                      this._Book["ISBN_Code"] = int.parse(value);
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.book.bookTitle.toString() : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Book title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Book Title'),
                  onSaved: (value) {
                    this._Book["Book_Title"] = value;
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.book.bookimage.toString() : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Book Image';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Book Image'),
                  onSaved: (value) {
                    this._Book["Book_image"] = value;
                  }),
                TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.book.bookdesc.toString() : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Book Description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Book description'),
                  onSaved: (value) {
                    this._Book["Book_desc"] = value;
                  }),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.book.status.toString() : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter category ID';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Category ID'),
                  onSaved: (value) {
                    setState(() {
                      this._Book["Category_id"] = int.parse(value);
                    });
                  }),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.book.status.toString() : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Book status';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Book Status'),
                  onSaved: (value) {
                    setState(() {
                      this._Book["status"] = int.parse(value);
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.book.authorid.toString() : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Author_id';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Author_id'),
                  onSaved: (value) {
                    setState(() {
                      this._Book["Author_id"] = int.parse(value);
                    });
                  }),
              TextFormField(
                  initialValue: widget.args.edit
                      ? widget.args.book.publicationyear.toString()
                      : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Publication year';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Publication_year'),
                  onSaved: (value) {
                    setState(() {
                      this._Book["Publication_year"] = int.parse(value);
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
                      final BookEvent event = widget.args.edit
                          ? BookUpdate(
                              Book(
                                isbnCode:widget.args.book.isbnCode,
                                authorid: this._Book["Author_id"],
                                bookTitle: this._Book["Book_Title"],
                                bookimage: this._Book["Book_img"],
                                bookdesc: this._Book["Book_desc"],
                                categoryid: this._Book["Category_id"],
                                status: this._Book["status"],
                                publicationyear: this._Book["Publication_year"],
                              ),
                            )
                          : BookCreate(
                              Book(
                                isbnCode: this._Book["ISBN_Code"],
                                bookTitle: this._Book["Book_Title"],
                                bookimage: this._Book["Book_img"],
                                bookdesc: this._Book["Book_desc"],
                                categoryid: this._Book["Category_id"],
                                authorid: this._Book["Author_id"],
                                status: this._Book["status"],
                                publicationyear: this._Book["Publication_year"],
                              ),
                            );
                      BlocProvider.of<BookBloc>(context).add(event);
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
