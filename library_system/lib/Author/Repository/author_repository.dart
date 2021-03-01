import 'package:meta/meta.dart';
import 'package:library_system/Author/Author.dart';


class AuthorRepository {
  final AuthorDataProvider dataProvider;

  AuthorRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  // Future<Author> createAuthor(Author author) async {
  //   return await dataProvider.createAuthor(author);
  // }

  Future<List<Author>> getAuthors() async {
    //dataProvider.getAuthors().then((value) => print(value));
    return await dataProvider.getAuthors();
  }

  Future<void> updateAuthor(Author author) async {
    await dataProvider.updateAuthor(author);
  }

  Future<void> deleteAuthor(Author author) async {
    await dataProvider.deleteAuthor(author);
  }
}
