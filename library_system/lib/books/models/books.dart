import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Book extends Equatable {
  final int isbnCode;
  final String bookTitle;
  final String bookimage;
  final String bookdesc;
  final int categoryid;
  final int status;
  final int authorid;
  final int publicationyear;

  Book(
      {@required this.isbnCode,
      @required this.bookTitle,
      @required this.bookimage,
      @required this.bookdesc,
      @required this.categoryid,
      @required this.status,
      @required this.authorid,
      @required this.publicationyear});

  @override
  // TODO: implement props
  List<Object> get props => [
        isbnCode,
        bookTitle,
        bookimage,
        bookdesc,
        categoryid,
        status,
        authorid,
        publicationyear
      ];

  factory Book.fromJson(Map<String, dynamic> json) {
    print(json['Book_img']);
    return Book(
      isbnCode: int.parse(json['ISBN_Code']),
      bookTitle: json['Book_Title'],
      bookimage: json['Book_img'].toString(),
      bookdesc: json['Book_desc'].toString(),
      categoryid: int.parse(json['Category_id']),
      status: int.parse(json['status']),
      authorid: int.parse(json['Author_id']),
      publicationyear: int.parse(json['Publication_year']),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ISBN_Code'] = this.isbnCode;
    data['Book_Title'] = this.bookTitle;
    data['Book_img'] = this.bookimage;
    data['Book_desc'] = this.bookdesc;
    data['Category_id'] = this.categoryid;
    data['status'] = this.status;
    data['Author_id'] = this.authorid;
    data['Publication_year'] = this.publicationyear;
    return data;
  }

  @override
  String toString() =>
      'Book {isbncode:$isbnCode, authorid:$authorid, publicatinyear:$publicationyear}';
}
