import 'package:flutter/material.dart';
import 'package:library_system/Author/Autho_customcarduser.dart';

import 'package:library_system/books/booksearch.dart';

import 'package:library_system/export.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            // key: globalKey,
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    showSearch(context: context, delegate: MainBookSearch());
                  },
                ),
              ],
              bottom: TabBar(
                unselectedLabelColor: twelfthColor,
                labelColor: secondColor,
                indicatorColor: secondColor,
                tabs: [
                  Tab(text: 'Home', icon: Icon(Icons.home)),
                  Tab(text: 'Authors', icon: Icon(Icons.person)),
                  Tab(text: 'Borrowed', icon: Icon(Icons.book)),
                  Tab(
                    text: 'Read',
                    icon: Icon(Icons.done),
                  )
                ],
              ),
              title: Center(child: Text("ዋሸራ")),
              backgroundColor: fourthColor,
            ),
            drawer: Drawer_(),
            body: TabBarView(
              children: [
                MainContent(),
                Authusercontent(),
                BorrowedContent(),
                HaveReadContent()
              ],
            )),
      ),
    );
  }
}
