import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/Borrow/repository/borrowrepository.dart';

import 'bloc.dart';

class BorrowBookBloc extends Bloc<BorrowEvent, BorrowState> {
  final BorrowRepository borrowRepository;

  BorrowBookBloc({@required this.borrowRepository, })
      : assert(borrowRepository != null),
        super(BorrowLoading());

  @override
  Stream<BorrowState> mapEventToState(BorrowEvent event) async* {
    if (event is BorrowLoad) {
      yield BorrowLoading();
      try {
        final books = await borrowRepository.getBorrowedBooks();
        yield BorrowLoadSuccess(books);
      } catch (_) {
        yield BorrowOperationFailure();
      }
    }

    if (event is BorrowBook) {
      try {
        await borrowRepository.borrowBooks(event.borrow);
        final books = await borrowRepository.getBorrowedBooks();
        yield BorrowLoadSuccess(books);
      } catch (_) {
        yield BorrowOperationFailure();
      }
    }

    if (event is RemoveBorrowed) {
      try {
        await borrowRepository.removeBorrowed(event.borrow);
        final books = await borrowRepository.getBorrowedBooks();
        yield BorrowLoadSuccess(books);
      } catch (_) {
        yield BorrowOperationFailure();
      }
    }
  }
}
