import 'package:flutter/cupertino.dart';
import 'package:library_system/export.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc({@required this.bookRepository})
      : assert(bookRepository != null),
        super(BookLoading());

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is BookLoad) {
      yield BookLoading();
      try {
        final book = await bookRepository.getbooks();
        yield BookLoadSuccess(book);
      } catch (_) {
        yield BookOperationFailure();
      }
    }
    if (event is BookCreate) {
      try {
        await bookRepository.createBook(event.book);
        
        final books = await bookRepository.getbooks();
        
        yield BookLoadSuccess(books);
      } catch (_) {
        yield BookOperationFailure();
      }
    }

    if (event is BookUpdate) {
      try {
        await bookRepository.updatebook(event.book);
        final books = await bookRepository.getbooks();
        yield BookLoadSuccess(books);
      } catch (_) {
        yield BookOperationFailure();
      }
    }

    if (event is BookDelete) {
      try {
        await bookRepository.deletebook(event.book);
        final books = await bookRepository.getbooks();
        yield BookLoadSuccess(books);
      } catch (_) {
        yield BookOperationFailure();
      }
    }
  }
}

