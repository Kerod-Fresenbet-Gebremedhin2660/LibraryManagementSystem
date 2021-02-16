

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_ystem/Adminitrator/tab.dart';
//import 'package:library_ystem/Adminitrator/tab.dart';

import '../navigation/navigation.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage2 extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            Tabs1(),
          ],
        ),
      ),
      
    );
  }
}
