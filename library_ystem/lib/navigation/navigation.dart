import 'package:bloc/bloc.dart';
import 'package:library_ystem/pages/authorspage.dart';
import 'package:library_ystem/pages/borrowedpage.dart';

import '../pages/selectedpage.dart';


import '../pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  AuthorClickedEvent,
  BorrowedClickedEvent,
  //SelectedPageClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => AuthorPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.AuthorClickedEvent:
        yield AuthorPage();
        break;
      case NavigationEvents.BorrowedClickedEvent:
        yield BorrowedPage();
        break;
      // case NavigationEvents.SelectedPageClickedEvent:
      //   yield SelectedPage();
      //   break;
    }
  }
}
