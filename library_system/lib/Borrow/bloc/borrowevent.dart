import 'package:equatable/equatable.dart';
import 'package:library_system/export.dart';

abstract class BorrowEvent extends Equatable {
  const BorrowEvent();
}

class BorrowLoad extends BorrowEvent {
  const BorrowLoad();

  @override
  List<Object> get props => [];
}

class BorrowBook extends BorrowEvent {
  final Borrow borrow;

  const BorrowBook(this.borrow);

  @override
  List<Object> get props => [borrow];

  @override
  String toString() => ' Added {book: $borrow}';
}

class RemoveBorrowed extends BorrowEvent {
  final Borrow borrow;

  const RemoveBorrowed(this.borrow);

  @override
  List<Object> get props => [borrow];

  @override
  toString() => 'Book Removed {book: $borrow}';
}
