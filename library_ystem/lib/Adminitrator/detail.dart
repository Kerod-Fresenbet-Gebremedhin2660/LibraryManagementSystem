import 'package:flutter/material.dart';
import 'package:library_ystem/constants.dart/constants.dart';

class Detail1 extends StatelessWidget {
  String str =
      "wethiwuthoituhoiwetgwoietugwieotoiugtwiugwerueiwrugwougtourgr eriuwgeweoiut wertoweitugwe tweitu wetioug wetoiuwgt iwoetug woeitug wioetug weiotu weotiugwe twoeitu wetiuwgte oweitug weoitugwe toiwuth wetiugwe toiuwgt iwut wieotug wieotug weoitug weotiugwe tiuwgtiwetug owiegt weoitug woeitug weoitug woitg iowetg wioetg oiwurg woietg wetiuwegr ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
                child: Image(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                      fit: BoxFit.fitHeight
                ),
              ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                "Name of Book",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Author:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 40),
                child: Text("Description",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              child: Text(str,
                  style: TextStyle(fontSize: 17,color: twelfthColor)),
            ),
          ],
        ),
      ),
    );
  }
}
