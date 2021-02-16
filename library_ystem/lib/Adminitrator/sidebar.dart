import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_ystem/constants.dart/constants.dart';
import 'package:library_ystem/navigation/navigation.dart';
import 'package:library_ystem/sidebar/menu_item.dart';

//import 'menu_item.dart';

// ignore: camel_case_types
class Drawer2_ extends StatelessWidget {
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
                    title:Row(
                      children: [
                        Text(
                        "Name",
                        style: TextStyle(
                            color: secondColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        child: 
                        Icon(Icons.done,
                        size:20,
                        color: secondColor,))
                      ]
                    ),
                    subtitle: Text(
                      "Email@gmail.com",
                      style: TextStyle(
                        color: twelfthColor,
                        fontSize: 18,
                      ),
                    ),
                    leading:
                        CircleAvatar(                          
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
            icon: Icons.settings,
            title: "settings",
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.HomePageClickedEvent);
            },
          ),
          MenuItem(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationEvents.HomePageClickedEvent);
            },
          )
        ],
      ),
    );
  }
}
