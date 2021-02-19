import 'package:flutter/material.dart';
import 'package:library_ystem/constants.dart/constants.dart';
import 'package:library_ystem/main.dart';
import '../pages/selectedpage.dart';
import '../books/form_add.dart';
import 'detail.dart';

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  Widget _customcard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5, bottom: 200, right: 200),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Detail()));
        },
        child: Container(
          margin: EdgeInsets.only(
            left: 5,
          ),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,
            child: Material(
              color: twelfthColor,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(8),
              shadowColor: fourthColor,
              child: Column(children: <Widget>[
                Image(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                  width: 150,
                  height: 200,
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      )),
                  child: Center(
                    child: Text("Book1",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width * 0.6;
    // return Scaffold(
    //   body: ListView.builder(
    //     itemCount: imgList.length,
    //     itemBuilder: (context, index) {
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, 
                  children: <Widget>[
                    _customcard(context),
                    _customcard(context),
                    _customcard(context),
                    _customcard(context),

      ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed:(){},
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // )
    );
    //     ListView(scrollDirection: Axis.vertical, children: <Widget>[
    //   Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Container(
    //       child: new FittedBox(
    //         child: Material(
    //             color: Colors.white,
    //             elevation: 14.0,
    //             borderRadius: BorderRadius.circular(24.0),
    //             shadowColor: Color(0x802196F3),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: <Widget>[
    //                 Container(
    //                   child: Padding(
    //                     padding: const EdgeInsets.only(left: 16.0),
    //                     child: myDetailsContainer1(),
    //                   ),
    //                 ),
    //                 Container(
    //                   width: 250,
    //                   height: 200,
    //                   child: ClipRRect(
    //                     borderRadius: new BorderRadius.circular(24.0),
    //                     child: Image(
    //                       fit: BoxFit.contain,
    //                       alignment: Alignment.topRight,
    //                       image: NetworkImage(
    //                           "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             )),
    //       ),
    //     ),
    //   ),
    // ]
  }
}
