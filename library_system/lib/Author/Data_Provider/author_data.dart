import 'dart:convert';
import 'package:library_system/Author/Author.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class AuthorDataProvider {
  final _baseUrl = 'http://192.168.43.87';
  final http.Client httpClient;

  AuthorDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Author> createAuthor(Author author) async {
    final response = await httpClient.post(
      Uri.http('http://localhost', '/php_rest_lms/api/post/create.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{

        'Author_id': author.author_id,

        'author_name': author.author_name
      }),
    );

    if (response.statusCode == 200) {
      return Author.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
}

Future<List<Author>> getAuthors() async {
  final response =
      await http.Client().get('$_baseUrl/php_rest_lms/api/post/read.php');
  
  if (response.statusCode == 200) {
    final books = jsonDecode(response.body) as List;
    return books.map((book) => Author.fromJson(book)).toList();
  } else {
    throw Exception('Failed to load books!');
  }
}

Future<void> deleteAuthor(Author author) async {
  final http.Response response = await httpClient.post(
    '$_baseUrl/php_rest_lms/api/post/delete_author.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body:  jsonEncode(<String, dynamic>{'ISBN_Code': author.author_id}));
  

  if (response.statusCode != 204) {
    throw Exception('Failed to delete course.');
  }
}

  Future<void> updateAuthor(Author author) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/php_rest_lms/api/update_author/${author.author_id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{

        'author_name': author.author_name,
        'author_id': author.author_id,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update course.');
    }
  }
}

