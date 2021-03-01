import 'package:equatable/equatable.dart';
import 'package:library_system/export.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();
}

class BookLoad extends BookEvent {
  const BookLoad();
  @override
  List<Object> get props => [];
}

class BookCreate extends BookEvent {
  final Book book;

  const BookCreate(this.book);

  @override
  List<Object> get props => [book];

  @override
  String toString() => 'Book Created {course: $book}';
}

class BookUpdate extends BookEvent {
  final Book book;

  const BookUpdate(this.book);

  @override
  List<Object> get props => [book];

  @override
  String toString() => 'Book Updated {course: $book}';
}

class BookDelete extends BookEvent {
  final Book book;

  const BookDelete(this.book);

  @override
  List<Object> get props => [book];

  @override
  toString() => 'Book Deleted {course: $book}';
}
