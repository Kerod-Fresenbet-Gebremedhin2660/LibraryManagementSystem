import 'dart:convert';
import 'package:library_system/export.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class BorrowDataProvider {
  final _baseUrl = 'http://192.168.43.87';
  final _baseurl2 = '192.168.43.87';
  final http.Client httpClient;

  BorrowDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Borrow> borrowBooks(Borrow borrow) async {
    final response = await httpClient.post(
      Uri.http(_baseurl2, '/php_rest_lms/api/post/create_borrower.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': borrow.borrower_id,
        'book id': borrow.book_id,
        'from': borrow.borrowedfrom,
        'to': borrow.borrowed_TO,
        'ReturnDate': borrow.actual_Return_Date,
        'issuedby': borrow.issued_by
      }),
    );
    print(response);
    if (response.statusCode == 200) {
      return Borrow.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<Borrow>> getBorrowedBooks() async {
    final response = await httpClient.get('$_baseUrl/php_rest_lms/api/post/');
    //print(response);
    if (response.statusCode == 200) {
      final courses = jsonDecode(response.body) as List;
      return courses.map((course) => Borrow.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<void> removeBorrowed(Borrow borrow) async {
    final http.Response response = await httpClient.post('$_baseUrl/courses/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'id': borrow.book_id}));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete course.');
    }
  }
}
