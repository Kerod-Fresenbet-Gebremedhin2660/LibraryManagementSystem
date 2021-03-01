import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Author extends Equatable {
  final int author_id;
  final String author_name;

  Author(
    {
    @required this.author_name,
    @required this.author_id,
    }
  );



  @override
  List<Object> get props => [ author_id, author_name];

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(

      author_id: int.parse(json['Author_id']),
      author_name: json['Author_Name']
    );
  }
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Author_id'] = this.author_id;
    data['Author_Name'] = this.author_name;
    return data;
  }
  @override
  String toString() => 'Course { author_id: $author_id}';
}
