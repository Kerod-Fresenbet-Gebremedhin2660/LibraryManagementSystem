import 'package:flutter/material.dart';
import 'export.dart';


class BookAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => AdminBookContent());
    }

    if (settings.name == AddUpdateBook.routeName) {
      BookArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) =>
              AddUpdateBook(
                args: args,
              ),
      );
    }

    if (settings.name == AdminBookContent.routeName) {
      Book book = settings.arguments;
      return MaterialPageRoute(
          builder: (context) =>
              AdminMainDetail(
              book:book,
              ));
    }
      else{
      return MaterialPageRoute(builder: (context) => HomePage2());
    }
    }
  }
  class BookArgument {
  final Book book;
  final bool edit;
  BookArgument({this.book, this.edit});
}




