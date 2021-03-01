import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/export.dart';

class MainBookSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return AdminBookContent();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final suggestionList = query.isEmpty
    //     ? recentCities
    //     : cities.where((p) => p.startsWith(query)).toList();

    return BlocBuilder<BookBloc, BookState>(builder: (_, state) {
      if (state is BookOperationFailure) {
        return Container(
            padding: EdgeInsets.fromLTRB(110, 220, 0, 0),
            child: Column(children: <Widget>[
              Icon(
                Icons.cached,
                color: twelfthColor,
              ),
              Text(
                "Couldnot Load books",
                style: TextStyle(color: twelfthColor),
              )
            ]));
      }

      if (state is BookLoadSuccess) {
        final books = state.books;
        return ListView.builder(
            itemCount: books.length,
            itemBuilder: (_, idx) => ListTile(
                  leading: Icon(Icons.location_city),
                  title: RichText(
                    text: TextSpan(
                        text: books[idx].bookTitle.substring(0, query.length),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text:
                                  books[idx].bookTitle.substring(query.length),
                              style: TextStyle(color: Colors.grey))
                        ]),
                  ),
                  // onTap: () {
                  //   showResults(context);
                  // },

                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainDetail(
                                  book: books[idx],
                                )));
                  },
                  onLongPress: () {
                    // _showToast(context);
                  },
                ));
      }
      return CircularProgressIndicator();
    });

  }
}
