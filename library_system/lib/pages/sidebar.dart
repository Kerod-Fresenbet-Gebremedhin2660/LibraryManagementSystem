import 'dart:io';

import 'package:flutter/material.dart';
import 'package:library_system/Author/authorspage.dart';
import 'package:library_system/export.dart';

import 'menu_item.dart';

// ignore: camel_case_types
class Drawer_ extends StatelessWidget {
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
                    title: Text(
                      "Name",
                      style: TextStyle(
                          color: secondColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      "Email",
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
                  context, MaterialPageRoute(builder: (context) => Tabs()));
            },
          ),
          MenuItem(
            icon: Icons.person,
            title: "Authors",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AuthorPage()));
            },
          ),
          MenuItem(
            icon: Icons.book,
            title: "Borrowed",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BorrowedPage()));
            },
          ),
          MenuItem(
            icon: Icons.bookmark,
            title: "Have Read",
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Tabs()));
            },
          ),
          Divider(
            height: 12,
            thickness: 0.5,
            // color: fourthColor.withOpacity(0.3),
            indent: 32,
            endIndent: 32,
          ),
          MenuItem(
            icon: Icons.settings,
            title: "Settings",
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
          MenuItem(
            icon: Icons.logout,
            title: "LOGOUT",
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
