// import 'package:flutter/material.dart';
// import '../constants.dart/constants.dart';

// import '../navigation/navigation.dart';

// import 'homepage.dart';

// class SelectedPage extends StatelessWidget with NavigationStates {
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         bottomNavigationBar: Container(
//           margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
//           height: 49,
//           color: fifthColor,
//           child: FlatButton(
//             color: fourthColor,
//             onPressed: () {
//               Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) =>
//                               HomePage(),
//                               ),
//                           );
//             },
  
//             child: Text("borrow",
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w700,
//                 color: secondColor,
//               ),
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         ),
//         body: SafeArea(
//           child: Container(
//             child: CustomScrollView(
//               slivers: [
//                 SliverAppBar(
//                   backgroundColor: seventhColor,
//                   expandedHeight: MediaQuery.of(context).size.height * 0.5,
//                   flexibleSpace: Container(
//                     color: eigthColor,
//                     height: MediaQuery.of(context).size.height * 0.5,
//                     child: Stack(
//                       children: [
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Container(
//                             margin: EdgeInsets.only(bottom: 62),
//                             // width: 1700,
//                             //height: 2500,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                     "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SliverList(
//                   delegate: SliverChildListDelegate([
//                     Padding(
//                       padding: EdgeInsets.only(
//                         top: 24,
//                         right: 25,
//                       ),
//                       child: Text(
//                         'book.name',
//                         style: TextStyle(
//                             fontSize: 27,
//                             color: fourthColor,
//                             ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         top: 7,
//                         right: 25,
//                       ),
//                       child: Text(
//                         'book.author',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color:fourthColor,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         top: 7,
//                         right: 25,
//                       ),
//                       child: Text(
//                         "کد کتاب: ",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: fourthColor,
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: <Widget>[
//                         Padding(
//                             padding: EdgeInsets.only(
//                               top: 7,
//                               right: 25,
//                             ),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "book.price.toString()efeiwuhpeth2  pi;efuoh2;puiheh\nqrhq3orih3oirh3otih32\nrhi3urh3iuh3iurh\n3rh3irh3iurh3iurh \nfwerihroqirhqorh\n ei3urh23iuri32urg\nq3rh3iurh3i2urh",
//                                   style: TextStyle(
//                                     fontSize: 32,
//                                     color: fourthColor,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 7,
//                                 ),
//                                 Text(
//                                   "تومان",
//                                   style: TextStyle(
//                                       fontSize: 18, color: fourthColor),
//                                 ),
//                               ],
//                             )),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             top: 7,
//                             right: 35,
//                           ),
//                           child: Text(
//                             "موجودwetrheiwtuhwethw;etihetwer",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: seventhColor ,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: 28,
//                       margin: EdgeInsets.only(top: 23, bottom: 36),
//                       padding: EdgeInsets.only(right: 25),
//                       child: DefaultTabController(
//                           length: 3,
//                           child: TabBar(
//                               labelPadding: EdgeInsets.all(0),
//                               indicatorPadding: EdgeInsets.all(0),
//                               isScrollable: true,
//                               labelColor: fourthColor,
//                               unselectedLabelColor: fourthColor,
//                               labelStyle: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700,
//                                   fontFamily: "Dana"),
//                               unselectedLabelStyle: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700,
//                                   fontFamily: "Dana"),
//                               tabs: [
//                                 Tab(
//                                     child: Directionality(
//                                   child: Container(
//                                     child: Text("توضیحات"),
//                                     margin: EdgeInsets.only(left: 39),
//                                   ),
//                                   textDirection: TextDirection.rtl,
//                                 )),
//                                 Tab(
//                                   child: Container(
//                                     child: Text("نظرات"),
//                                     margin: EdgeInsets.only(left: 39),
//                                   ),
//                                 ),
//                                 Tab(
//                                   child: Container(
//                                     child: Text("کتاب‌های مشابه"),
//                                     margin: EdgeInsets.only(left: 39),
//                                   ),
//                                 ),
//                               ])),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(
//                           left: 25,
//                           right: 25,
//                           bottom: 25,
//                         ),
//                         child: Text(
//                           "book.description",
//                           style: TextStyle(
//                               fontSize: 12,
//                               color: fourthColor,
//                               letterSpacing: 1.5,
//                               height: 2),
//                         ))
//                   ]),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
