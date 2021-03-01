// import 'package:flutter/material.dart';
// import 'package:library_ystem/export.dart';

// class BookAppRoute {
//   static Route generateRoute(RouteSettings settings) {
//     if (settings.name == '/') {
//       return MaterialPageRoute(builder: (context) =>HomePage2());
//     }

//     // if (settings.name == AddUpdateBook.routeName) {
//     //   BookArgument args = settings.arguments;
//     //   return MaterialPageRoute(
//     //       builder: (context) => AddUpdateBook(
//     //             args: args,
//     //           ));
//     // }

//     if (settings.name == Detail1.routeName) {
//       Book book = settings.arguments;
//       return MaterialPageRoute(
//           builder: (context) => Detail1(
//                 book: book,
//               ));
//     }

//     return MaterialPageRoute(builder: (context) => HomePage2());
//   }
// }

// class BookArgument {
//   final Book book;
//   final bool edit;
//   BookArgument({this.book, this.edit});
// }
