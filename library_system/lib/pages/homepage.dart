

import 'package:flutter/material.dart';
import 'package:library_system/export.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      // body: BlocProvider<NavigationBloc>(
      //   create: (context) => NavigationBloc(),
      //   child: Stack(
      //     children: <Widget>[
      //       BlocBuilder<NavigationBloc, NavigationStates>(
      //         builder: (context, navigationState) {
      //           return navigationState as Widget;
      //         },
      //       ),
      body:
            Tabs(),
        );
      
      
    
  }
}
