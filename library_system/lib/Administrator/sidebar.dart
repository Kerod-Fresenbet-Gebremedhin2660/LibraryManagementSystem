import 'dart:io';
import 'package:flutter/material.dart';
import 'package:library_system/Administrator/settings.dart';
import 'package:library_system/export.dart';


//import 'menu_item.dart';

// ignore: camel_case_types
class Drawer2_ extends StatelessWidget {
// final Book book;
//   Drawer2_({@required this.book});

  @override
  Widget build(context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: fourthColor,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Row(children: [
                      Text(
                        "NAME",
                        //this.book.bookTitle,
                        style: TextStyle(
                            color: secondColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 3),
                          child: Icon(
                            Icons.done,
                            size: 20,
                            color: secondColor,
                          ))
                    ]),
                    subtitle: Text(
                      "Email@gmail.com",
                      style: TextStyle(
                        color: twelfthColor,
                        fontSize: 14,
                      ),
                    ),
                    leading: CircleAvatar(
                      // child: Icon(
                      //   Icons.perm_identity,
                      //   color: secondColor,
                      child: Image.network(""),

                      radius: 40,
                    ),
                  ),
                ],
              )),
          MenuItem(
            icon: Icons.home,
            title: "Home",
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Tabs1()));
            },
          ),
          MenuItem(
            icon: Icons.settings,
            title: "settings",
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AdminSettings()));
            },
          ),
          MenuItem(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              exit(0);
            },
          )
        ],
      ),
    );
  }
}
