import 'package:flutter/material.dart';
import 'package:library_system/Borrow/detail.dart';
import 'package:library_system/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HaveReadContent extends StatefulWidget {
  Book book;
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<HaveReadContent> {
  Widget _customcard(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5, bottom: 200, right: 200),
      child: Container(
        margin: EdgeInsets.only(
          left: 5,
        ),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topLeft,
          child: Material(
            color: twelfthColor,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(8),
            shadowColor: fourthColor,
            child: Column(children: <Widget>[
              Image(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                width: 150,
                height: 200,
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                    color: twelfthColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    )),
                child: Center(
                  child: Text(title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 80) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: BlocBuilder<BookBloc, BookState>(builder: (_, state) {
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
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: (itemWidth / itemHeight)),
              itemCount: books.length,
              itemBuilder: (_, index) =>Container(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HaveReadDetail(
                                      book:books[index],
                                    )));
                          },
                          child: Card(
                            elevation: 10.0,
                            child: Column(
                              children: <Widget>[
                                Image(
                                  image: NetworkImage(books[index].bookimage),
                                      //"https://edit.org/images/cat/book-covers-big-2019101610.jpg"),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  child: Text('${books[index].bookTitle}'),
                                )
                              ],
                            ),
                            
                          ),
                        ),

                      )
            );
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
                      fontSize: 24,
                    ),
                  )
                ],
              ));
      }),
    );
  }
}
