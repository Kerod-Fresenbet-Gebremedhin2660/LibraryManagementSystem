import 'package:equatable/equatable.dart';
import 'package:library_system/export.dart';


class BorrowState extends Equatable {
  const BorrowState();

  @override
  List<Object> get props => [];
}

class BorrowLoading extends BorrowState {}

class BorrowLoadSuccess extends BorrowState {
  final List<Borrow> borrow;

  BorrowLoadSuccess([this.borrow = const []]);

  @override
  List<Object> get props => [borrow];
}

class BorrowOperationFailure extends BorrowState {}
