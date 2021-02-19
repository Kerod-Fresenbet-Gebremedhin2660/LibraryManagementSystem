import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_ystem/constants.dart/constants.dart';
import 'package:library_ystem/navigation/navigation.dart';
import 'package:library_ystem/pages/borrowedpage.dart';

import 'menu_item.dart';

// ignore: camel_case_types
class Drawer_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          fontSize: 30,
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      "Email",
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 18,
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
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.HomePageClickedEvent);
            },
          ),
          MenuItem(
            icon: Icons.person,
            title: "Authors",
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.HomePageClickedEvent);
            },
          ),
          MenuItem(
            icon: Icons.book,
            title: "Borrowed",
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.HomePageClickedEvent);
            },
            onDoubleTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BorrowedPage()));
            },
          ),
          MenuItem(
            icon: Icons.bookmark,
            title: "Have Read",
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.HomePageClickedEvent);
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
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.BorrowedClickedEvent);
            },
          ),
          MenuItem(
            icon: Icons.logout,
            title: "LOGOUT",
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.AuthorClickedEvent);
            },
          ),
        ],
      ),
    );
  }
}
