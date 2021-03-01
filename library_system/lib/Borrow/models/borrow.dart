import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Borrow extends Equatable {
  int borrower_id;
  int book_id;
  String borrowedfrom;
  String borrowed_TO;
  int actual_Return_Date;
  String issued_by;
  
  Borrow(
      {@required this.borrower_id,
      @required this.book_id,
      @required this.borrowedfrom,
      @required this.borrowed_TO,
      @required this.actual_Return_Date,
      @required this.issued_by});

  @override
  // TODO: implement props
  List<Object> get props => [
        borrower_id,
        book_id,
        borrowedfrom,
        borrowed_TO,
        actual_Return_Date,
        issued_by,
      ];

  factory Borrow.fromJson(Map<String, dynamic> json) {
    return Borrow(
      borrower_id: int.parse(json['Borrower_id']),
      book_id: int.parse(json['Book_id']),
      borrowedfrom: json['Borrowed_From'],
      borrowed_TO: json['Borrowed_TO'],
      actual_Return_Date: int.parse(json['Actual_Return_Date']),
      issued_by: json['Issued_by'],
    );
  }

  @override
  String toString() =>
      'Book {Borrower:$borrower_id, Bookid:$book_id, returndate:$actual_Return_Date,}';
}
