import 'package:equatable/equatable.dart';
import 'package:library_system/Author/Author.dart';


abstract class AuthorEvent extends Equatable {
  const AuthorEvent();
}

class AuthorLoad extends AuthorEvent {
  const AuthorLoad();
  @override
  List<Object> get props => [];
}

class AuthorCreate extends AuthorEvent {
  final Author author;

  const AuthorCreate(this.author);

  @override
  List<Object> get props => [author];

  @override
  String toString() => 'Author Created {course: $author}';
}

class AuthorUpdate extends AuthorEvent {
  final Author author;

  const AuthorUpdate(this.author);

  @override
  List<Object> get props => [author];

  @override
  String toString() => 'Author Updated {course: $author}';
}

class AuthorDelete extends AuthorEvent {
  final Author author;

  const AuthorDelete(this.author);

  @override
  List<Object> get props => [author];

  @override
  toString() => 'Author Deleted {course: $author}';
}
