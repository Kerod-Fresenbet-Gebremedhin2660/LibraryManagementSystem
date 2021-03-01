import 'package:meta/meta.dart';
import 'package:library_system/export.dart';

class BookRepository {
  final BookDataProvider dataProvider;

  BookRepository({@required this.dataProvider})
      : assert(dataProvider != null),
        super();

  Future<Book> createBook(Book book) async {
    return await dataProvider.createBook(book);
  }

  Future<List<Book>> getbooks() async {
    return await dataProvider.getBooks();
  }

  Future<void> updatebook(Book book) async {
    await dataProvider.updateBook(book);
  }

  Future<void> deletebook(Book book) async {
    await dataProvider.deleteBook(book);
  }
}
