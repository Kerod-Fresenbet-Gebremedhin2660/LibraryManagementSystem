import 'package:library_system/export.dart';
import 'package:meta/meta.dart';

class BorrowRepository {
  final BorrowDataProvider dataProvider;

  BorrowRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<Borrow> borrowBooks(Borrow borrow) async {
    return await dataProvider.borrowBooks(borrow);
  }

  Future<List<Borrow>> getBorrowedBooks() async {
    return await dataProvider.getBorrowedBooks();
  }


  Future<void> removeBorrowed(Borrow borrow) async {
    await dataProvider.removeBorrowed(borrow);
  }
}
