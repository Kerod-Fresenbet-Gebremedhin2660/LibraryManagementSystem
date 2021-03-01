import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/export.dart';

class AdminBookContent extends StatefulWidget {
  static const routeName = '/';
  //Book book;
  @override
  _AdminBookContentState createState() => _AdminBookContentState();
}

class _AdminBookContentState extends State<AdminBookContent> {
  // Widget _card(String title, String imageurl) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 5, top: 5, bottom: 200, right: 200),
  //     child: Container(
  //       margin: EdgeInsets.only(
  //         left: 5,
  //       ),
  //       child: FittedBox(
  //         fit: BoxFit.fitWidth,
  //         alignment: Alignment.topLeft,
  //         child: Material(
  //           color: Colors.grey,
  //           elevation: 14.0,
  //           borderRadius: BorderRadius.circular(8),
  //           shadowColor: fourthColor,
  //           child: Column(children: <Widget>[
  //             Image(
  //               image: NetworkImage(imageurl),
  //               //https://www.desktopbackground.org/p/2014/10/27/846530_hd-books-wallpapers_1680x1050_h.jpg
  //               width: 150,
  //               height: 200,
  //             ),
  //             Container(
  //               width: 150,
  //               decoration: BoxDecoration(
  //                   color: twelfthColor,
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.zero,
  //                     topRight: Radius.zero,
  //                     bottomLeft: Radius.circular(8),
  //                     bottomRight: Radius.circular(8),
  //                   )),
  //               child: Center(
  //                 child: Text(title,
  //                     style: TextStyle(
  //                       fontSize: 24.0,
  //                       fontWeight: FontWeight.bold,
  //                     )),
  //               ),
  //             )
  //           ]),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(context) {
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
            //print(books[0].bookimage);
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: (itemWidth / itemHeight)),
                itemCount: books.length,
                itemBuilder: (_, index) => Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminMainDetail(
                                        book: books[index],
                                      )));
                        },
                        child: Card(
                          elevation: 10.0,
                          child: Column(
                            children: <Widget>[
                              Image(image: NetworkImage("${books[index].bookimage}")

                                  //"https://edit.org/images/cat/book-covers-big-2019101610.jpg"),
                                  ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text('${books[index].bookTitle}'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ));

            // ListView.builder(
            //     itemCount: books.length,
            //     itemBuilder: (_, index) => ListTile(
            //           title: _card('${books[index].bookTitle}','${books[index].bookimage}'),
            //           onTap: () {

            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => AdminMainDetail(
            //                           book: books[index],
            //                         )));
            //           },
            //           onLongPress: () {
            //             // _showToast(context);
            //           },
            //         ));
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: fourthColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddUpdateBook(
                          args: BookArgument(edit: false),
                        )));
          },
          tooltip: 'ADD Authors',
          child: Icon(Icons.add),
        ));
  }
}
