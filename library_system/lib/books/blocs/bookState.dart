import 'package:equatable/equatable.dart';
import 'package:library_system/export.dart';

class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookLoading extends BookState {}

class BookLoadSuccess extends BookState {
  final List<Book> books;

  BookLoadSuccess([this.books = const []]);

  @override
  List<Object> get props => [books];
}

class BookOperationFailure extends BookState {}
