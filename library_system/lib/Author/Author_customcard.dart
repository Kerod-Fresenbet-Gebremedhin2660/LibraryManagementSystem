import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/export.dart';
import 'authordetail.dart';

class Authcontent extends StatefulWidget {
  static const routeName = '/';
  @override
  _AuthContentState createState() => _AuthContentState();
}

class _AuthContentState extends State<Authcontent> {

  @override
  Widget build(context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 80) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        body: BlocBuilder<AuthorBloc, AuthorState>(
          builder: (_, state) {
            if (state is AuthorOperationFailure) {
              return Container(
                  padding: EdgeInsets.fromLTRB(110, 220, 0, 0),
                  child: Column(children: <Widget>[
                    Icon(
                      Icons.cached,
                      color: twelfthColor,
                    ),
                    Text(
                      "Couldnot Load Autors",
                      style: TextStyle(color: twelfthColor),
                    )
                  ]));
            }
            if (state is AuthorLoadSuccess) {
              final authors = state.authors;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: (itemWidth / itemHeight)),
                  itemCount: authors.length,
                  itemBuilder: (_, index) => Container(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminAuthDetail(
                                      author:authors[index],
                                    )));
                          },
                          child: Card(
                            elevation: 10.0,
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image: NetworkImage(
                                      "https://www.standoutbooks.com/wp-content/uploads/2013/11/Author-Profile-Picture-4.jpg"),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  child: Text('${authors[index].author_name}'),
                                )
                              ],
                            ),
                            
                          ),
                        ),

                      )
                  // ListBody(
                  //   children: [_card('${authors[idx].author_name}')],
                  // ),
                  );
            }
            return Container(
                padding: EdgeInsets.fromLTRB(110, 220, 0, 0),
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(twelfthColor),
                    ),
                    Text(
                      "Loading",
                      style: TextStyle(
                        color: twelfthColor,
                        fontSize: 14,
                      ),
                    )
                  ],
                ));
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: fourthColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddUpdateAuthor(
                          args: AuthorArgument(edit: false),
                        )));
          },
          tooltip: 'ADD Author',
          child: Icon(Icons.add),
        ));
  }
}
