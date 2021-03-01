import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/Author/authordetail.dart';
import 'package:library_system/export.dart';

class AuthorSearch extends SearchDelegate<String> {
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

    return BlocBuilder<AuthorBloc, AuthorState>(builder: (_, state) {
      if (state is AuthorOperationFailure) {
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

      if (state is AuthorLoadSuccess) {
        final authors = state.authors;
        return ListView.builder(
            itemCount: authors.length,
            itemBuilder: (_, index) => ListTile(
                  leading: Icon(Icons.person),
                  title: RichText(
                    text: TextSpan(
                        text: authors[index].author_name.substring(0, query.length),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text:
                                  authors[index].author_name.substring(query.length),
                              style: TextStyle(color: Colors.grey))
                        ]),
                  ),
                  

                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminAuthDetail(
                                  author: authors[index],
                                )));
                  },
                  
                ));
      }
      return Container(
              padding: EdgeInsets.fromLTRB(110, 220, 0, 0),
              child: Column(
                children: [
                  CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(twelfthColor),
                  ),
                  Text(
                    "Loading",
                    style: TextStyle(
                        color: twelfthColor,
                        fontSize: 14,),
                  )
                ],
              ));
    });

  }
}
