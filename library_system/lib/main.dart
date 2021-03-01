import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_system/Borrow/bloc/bloc.dart';
//import 'package:library_ystem/Borrow/repository/repository.dart';
import 'export.dart';
import 'package:http/http.dart' as http;

void main() {
  final AuthorRepository authorRepository = AuthorRepository(
    dataProvider: AuthorDataProvider(
      httpClient: http.Client(),
    ),
  );
  final BookRepository bookRepository =
      BookRepository(dataProvider: BookDataProvider(httpClient: http.Client()));
  final BorrowRepository borrowRepository = BorrowRepository(
    dataProvider: BorrowDataProvider(httpClient: http.Client()),
  );

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              BookBloc(bookRepository: bookRepository)..add(BookLoad()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              AuthorBloc(authorRepository: authorRepository)..add(AuthorLoad()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              BorrowBookBloc(borrowRepository: borrowRepository)
                ..add(BorrowLoad()),
        )
      ],
      child: MyApp(
          authorRepository: authorRepository, bookRepository: bookRepository, borrowRepository: borrowRepository,)));
}

class MyApp extends StatelessWidget {
  final AuthorRepository authorRepository;
  final BookRepository bookRepository;
  final BorrowRepository borrowRepository;

  MyApp(
      {@required this.authorRepository,
      @required this.bookRepository,
      @required this.borrowRepository})
      : assert(authorRepository != null, bookRepository != null);
  @override
  Widget build(context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: this.authorRepository,
          ),
          RepositoryProvider.value(
            value: this.bookRepository,
          ),
          RepositoryProvider.value(
            value: this.borrowRepository,
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: secondColor, primaryColor: secondColor),
          home: MyHomePage(),
          onGenerateRoute: BookAppRoute.generateRoute,
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      body: HomePage2(),
    );
  }
}
