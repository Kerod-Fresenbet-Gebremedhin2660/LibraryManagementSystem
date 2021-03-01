import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/export.dart';

// ignore: must_be_immutable
class AdminAuthDetail extends StatelessWidget {
  // String str =
  //     "wethiwuthoituhoiwetgwoietugwieotoiugtwiugwerueiwrugwougtourgr eriuwgeweoiut wertoweitugwe tweitu wetioug wetoiuwgt iwoetug woeitug wioetug weiotu weotiugwe twoeitu wetiuwgte oweitug weoitugwe toiwuth wetiugwe toiuwgt iwut wieotug wieotug weoitug weotiugwe tiuwgtiwetug owiegt weoitug woeitug weoitug woitg iowetg wioetg oiwurg woietg wetiuwegr ";
  static const routeName = "detailspage";
  final Author author;
  AdminAuthDetail({@required this.author});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                '${this.author.author_name}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children:[ 
                SizedBox(width: 150,),
                IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<AuthorBloc>().add(AuthorDelete(this.author));
                  Navigator.pushNamedAndRemoveUntil(
                      context, Authcontent.routeName, (route) => true);
                },
              ),
            
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddUpdateBook(
                            args: BookArgument(edit: true),
                          ))),
            ),]),
            
            Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Author ID:${this.author.author_id}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 40),
                child: Text("Biography",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
