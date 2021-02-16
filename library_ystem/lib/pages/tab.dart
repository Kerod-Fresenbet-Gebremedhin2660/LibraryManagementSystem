import 'package:flutter/material.dart';
import 'package:library_ystem/Adminitrator/sidebar.dart';
import 'package:library_ystem/pages/customcard.dart';
import 'package:library_ystem/sidebar/sidebar.dart';
import '../constants.dart/constants.dart';

import 'package:library_ystem/pages/selectedpage.dart';

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
                  onPressed: () {},
                ),
                // PopupMenuButton(
                //   itemBuilder: (BuildContext context) {
                //     return [
                //       PopupMenuItem(
                //         child: Row(
                //           children: [
                //             IconButton(
                //               icon: Icon(Icons.settings,color:tenthColor,),
                //               onPressed: () {},
                //             ),
                //             Text("Settings"),
                //           ],
                //         ),
                //         value: "Settings",
                //       )
                //     ];
                //   },
                // )
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
            body: //Content()
                TabBarView(
              children: [
                Content(),Content(),Content(),Content()
                // ListView(
                //   children: [Content(), Content(), Content(), Content()],
                // ),
                // ListView(
                //   children: [Content(), Content(), Content(), Content()],
                // ),
                // ListView(
                //   children: [Content(), Content(), Content(), Content()],
                // ),
                // ListView(
                //   children: [Content(), Content(), Content(), Content()],
                // )
              ],
            )),
      ),
    );
  }
}

Widget _buildBar(BuildContext context) {
  return new AppBar(
    centerTitle: true,
    title: Text('Search...'),
    leading: new IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
  );
}

//   void _searchPressed() {
//     setState()
//   // setState()( {
//   //   if (this._searchIcon.icon == Icons.search) {
//   //     this._searchIcon = new Icon(Icons.close);
//   //     this._appBarTitle = new TextField(
//   //       decoration: new InputDecoration(
//   //           prefixIcon: new Icon(Icons.search),
//   //           hintText: 'Search...'
//   //       ),
//   //     );
//   //   } else {
//   //     this._searchIcon = new Icon(Icons.search);
//   //     this._appBarTitle = new Text('Search Example');
//   //   }
//   // });
// }

// divider(
//                         height: 64,
//                         thickness: 0.5,
//                         color: secondColor.withOpacity(0.3),
//                         indent: 32,
//                         endIndent: 32,
//                       ),
//                       MenuItem(
//                         icon: Icons.home,
//                         title: "Home",
//                         onTap: () {
//                           onIconPressed();
//                           BlocProvider.of<NavigationBloc>(context)
//                               .add(NavigationEvents.HomePageClickedEvent);
//                         },
//                       ),
//                       MenuItem(
//                         icon: Icons.person,
//                         title: "My Account",
//                         onTap: () {
//                           onIconPressed();
//                           BlocProvider.of<NavigationBloc>(context)
//                               .add(NavigationEvents.MyAccountClickedEvent);
//                         },
//                       ),
//                       MenuItem(
//                         icon: Icons.shopping_basket,
//                         title: "My Orders",
//                         onTap: () {
//                           onIconPressed();
//                           BlocProvider.of<NavigationBloc>(context)
//                               .add(NavigationEvents.MyOrdersClickedEvent);
//                         },
//                       ),
//                       MenuItem(
//                         icon: Icons.card_giftcard,
//                         title: "Wishlist",
//                       ),
//                       Divider(
//                         height: 64,
//                         thickness: 0.5,
//                         color: secondColor.withOpacity(0.3),
//                         indent: 32,
//                         endIndent: 32,
//                       ),
//                       MenuItem(
//                         icon: Icons.settings,
//                         title: "Settings",
//                       ),
//                       MenuItem(
//                         icon: Icons.exit_to_app,
//                         title: "Logout",
