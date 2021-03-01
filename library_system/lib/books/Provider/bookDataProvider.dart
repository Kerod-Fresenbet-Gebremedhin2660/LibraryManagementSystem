import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:library_system/export.dart';

class BookDataProvider {
  final _baseUrl = 'http://192.168.43.87';
  final _baseUrl2 = '192.168.43.87';
  final http.Client httpClient;

  BookDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Book> createBook(Book book) async {
    final response = await httpClient.post(
      Uri.http(_baseUrl2, '/php_rest_lms/api/post/create_book.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'ISBN_Code': book.isbnCode,
        'status': book.status,
        'Book_Title': book.bookTitle,
        'Book_img': book.bookimage,
        'Book_desc': book.bookdesc,
        'Author_id': book.authorid,
        'Category_id': book.categoryid,
        'Publication_year': book.publicationyear
      }),
    );

    if (response.statusCode == 200) {
      print("In Create Book Data Provider Layer!");
      return Book.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<Book>> getBooks() async {
    final response =
        await httpClient.get('$_baseUrl/php_rest_lms/api/post/read_books.php');

    if (response.statusCode == 200) {
      final books = jsonDecode(response.body) as List;
      //print(books);
      return books.map((book) => Book.fromJson(book)).toList();
    } else {
      throw Exception('Failed to load Books');
    }
  }

  Future<Book> getBook(int isbnCode) async {
    final response = await httpClient.get(
        '$_baseUrl/php_rest_lms/api/post/read_single_ISBN.php?ISBN_Code=$isbnCode');

    if (response.statusCode == 200) {
      final book = jsonDecode(response.body);
      return Book.fromJson(book);
    } else {
      throw Exception('Failed to load Book');
    }
  }

  Future<void> deleteBook(Book book) async {
    final http.Response response =
        await httpClient.post('$_baseUrl/php_rest_lms/api/post/delete_book.php',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{'ISBN_Code': book.isbnCode}));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete Book.');
    }
  }

  Future<void> updateBook(Book book) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/php_rest_lms/api/post/update_book.php?ISBN_Code=${book.isbnCode}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        
        'Book_Title': book.bookTitle.toString(),
        'Book_img': book.bookimage.toString(),
        'Book_desc': book.bookdesc.toString(),
        'Category_id': book.categoryid.toString(),
        'status': book.status.toString(),
        "Publication_year": book.publicationyear.toString()
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update Book.');
    } else {
      print('successful Book Update');
    }
  }
}
