import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/export.dart';

// ignore: must_be_immutable
class AdminMainDetail extends StatelessWidget {
  // String str =
  //     "wethiwuthoituhoiwetgwoietugwieotoiugtwiugwerueiwrugwougtourgr eriuwgeweoiut wertoweitugwe tweitu wetioug wetoiuwgt iwoetug woeitug wioetug weiotu weotiugwe twoeitu wetiuwgte oweitug weoitugwe toiwuth wetiugwe toiuwgt iwut wieotug wieotug weoitug weotiugwe tiuwgtiwetug owiegt weoitug woeitug weoitug woitg iowetg wioetg oiwurg woietg wetiuwegr ";
  static const routeName = "detailspage";
  final Book book;
  AdminMainDetail({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              child: Image(
                  image: NetworkImage("${this.book.bookimage}"),
                      
                  fit: BoxFit.fitHeight),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                this.book.bookTitle,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            
            Row(
              children:[
                SizedBox(width: 200,height: 70,),
                ElevatedButton(
                style: ElevatedButton.styleFrom(primary: fourthColor),
                child: Row(
                  children: <Widget>[
                  Icon(Icons.delete),
                  Text("Delete")
               
                ],
                ),
                 onPressed: () {
                  context.read<BookBloc>().add(BookDelete(this.book));
                  Navigator.pushNamedAndRemoveUntil(context,
                      AdminBookContent.routeName, (route) => true);
                }, 
              ),
              SizedBox(width: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: fourthColor),
                child:Row(
                  children: <Widget>[
                  Icon(Icons.edit),
                  Text("Edit")
               
                ],
                ),
                onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => 
                AddUpdateBook(args: BookArgument(book:this.book,edit: true),))
              )),
              
              ]
            ),
            
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Author:${this.book.authorid}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Category:${this.book.categoryid}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Published on:${this.book.publicationyear}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 40),
                child: Text("Description",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(this.book.bookdesc,
                  style: TextStyle(fontSize: 17, color: twelfthColor)),
            ),
          ],
        ),
      ),
    );
  }
}
