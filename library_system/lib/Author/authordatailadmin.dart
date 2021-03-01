import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/export.dart';

// ignore: must_be_immutable
class AdminAuthDetail extends StatelessWidget {
  String str =
      "wethiwuthoituhoiwetgwoietugwieotoiugtwiugwerueiwrugwougtourgr eriuwgeweoiut wertoweitugwe tweitu wetioug wetoiuwgt iwoetug woeitug wioetug weiotu weotiugwe twoeitu wetiuwgte oweitug weoitugwe toiwuth wetiugwe toiuwgt iwut wieotug wieotug weoitug weotiugwe tiuwgtiwetug owiegt weoitug woeitug weoitug woitg iowetg wioetg oiwurg woietg wetiuwegr ";
  static const routeName = "detailspage";
  final Author author;
  AdminAuthDetail({@required this.author});

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
                  fit: BoxFit.fitHeight),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                this.author.author_name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<AuthorBloc>().add(AuthorDelete(this.author));
                Navigator.pushNamedAndRemoveUntil(context,
                    Authcontent.routeName, (route) => true);
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddUpdateBook(args: BookArgument(edit: true),))
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Author:${this.author.author_id}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Birthdate:${this.author.author_id}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Text(str,
                  style: TextStyle(fontSize: 17, color: twelfthColor)),
            ),
          ],
        ),
      ),
    );
  }
}
