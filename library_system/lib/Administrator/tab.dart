import 'package:flutter/material.dart';

import 'package:library_system/export.dart';

class Tabs1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            // key: globalKey,
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.search,),
                  onPressed: () {
                    showSearch(context: context, delegate: BookSearch());
                  },
                ),

              ],
              bottom: TabBar(
                unselectedLabelColor: twelfthColor,
                labelColor: secondColor,
                indicatorColor: secondColor,
                tabs: [
                  Tab(text: "Books",icon: Icon(Icons.book)),
                  Tab(text: "Authors",icon:Icon(Icons.person))
                ],
              ),
              title: Center(child: Text("ዋሸራ")),
              backgroundColor: fourthColor,
            ),
            drawer: Drawer2_(),
            body: //Content()
                TabBarView(
              children: [AdminBookContent(), Authcontent()],
            )),
      ),
    );
  }
}

