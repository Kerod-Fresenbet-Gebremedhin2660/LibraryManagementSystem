import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/Author/Author.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final AuthorRepository authorRepository;

  AuthorBloc({@required this.authorRepository})
      : assert(authorRepository != null),
        super(AuthorLoading());
  @override

  Stream<AuthorState> mapEventToState(AuthorEvent event) async* {
    if (event is AuthorLoad) {
      yield AuthorLoading();
      try {
        final authors = await authorRepository.getAuthors();
        yield AuthorLoadSuccess(authors);
      } catch (_) {
        yield AuthorOperationFailure();
      }
    }
    // if (event is AuthorCreate) {
    //   try {
    //     await authorRepository.createAuthor(event.author);
    //     final authors = await authorRepository.getAuthors();
    //     yield AuthorLoadSuccess(authors);
    //   } catch (_) {
    //     yield AuthorOperationFailure();
    //   }
    // }
    
    if (event is AuthorUpdate) {
      try {
        await authorRepository.updateAuthor(event.author);
        final authors = await authorRepository.getAuthors();
        yield AuthorLoadSuccess(authors);
      } catch (_) {
        yield AuthorOperationFailure();
      }
    }

    if (event is AuthorDelete) {
      try {
        await authorRepository.deleteAuthor(event.author);
        final authors = await authorRepository.getAuthors();
        yield AuthorLoadSuccess(authors);
      } catch (_) {
        yield AuthorOperationFailure();
      }
    }
  }
}
