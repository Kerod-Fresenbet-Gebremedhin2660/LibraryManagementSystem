import 'package:equatable/equatable.dart';
import 'package:library_system/Author/Author.dart';
import 'package:meta/meta.dart';

class AuthorState extends Equatable {
  const AuthorState();

  @override
  List<Object> get props => [];
}

class AuthorLoading extends AuthorState {}

class AuthorLoadSuccess extends AuthorState {
  final List<Author> authors;
  AuthorLoadSuccess([this.authors= const[]]);

  @override
  List<Object> get props => [authors];
}

class AuthorOperationFailure extends AuthorState {}
