import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/export.dart';


class AddUpdateAuthor extends StatefulWidget {
  static const routeName = 'AuthorAddUpdate';
  final AuthorArgument args;

  const AddUpdateAuthor({Key key, this.args});

  @override
  _AddUpdateAuthorState createState() => _AddUpdateAuthorState();
}

class _AddUpdateAuthorState extends State<AddUpdateAuthor> {
  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  final Map<String, dynamic> _Author = {};

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fourthColor,
        title: Text('${widget.args.edit ? "Edit Author" : "Add New Author"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.author : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Author id';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'author_id'),
                  onSaved: (value) {
                    setState(() {
                      this._Author["Author_id"] = int.parse(value);
                    });
                  }),
              TextFormField(
                  initialValue:
                  widget.args.edit ? widget.args.author.author_name : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Author name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Author name'),
                  onSaved: (value) {
                    this._Author["Author_name"] = value;
                  }),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: fourthColor),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      final AuthorEvent event = widget.args.edit
                          ? AuthorUpdate(
                              Author(
                                  author_id: this._Author["Author_id"],
                                  author_name: this._Author["Author_name"],

                            ))
                          : AuthorCreate(
                              Author( 
                                author_id: this._Author["Author_id"], 
                                author_name: this._Author["Author_name"],
                              ),
                            );
                      BlocProvider.of<AuthorBloc>(context).add(event);
                      Navigator.pushNamedAndRemoveUntil(context,
                          Authcontent.routeName, (route) => false);
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

  class AuthorArgument {
  final Author author;
  final bool edit;
  AuthorArgument({this.author, this.edit});
}