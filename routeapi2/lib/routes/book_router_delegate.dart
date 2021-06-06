import 'package:flutter/material.dart';
import 'package:routeapi2/models/book_model.dart';
import 'package:routeapi2/screens/book_detail_screen.dart';
import 'package:routeapi2/screens/books_list_screen.dart';
import 'package:routeapi2/screens/unknown_screen.dart';

import 'book_route_path.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Book? _selectedBook;
  bool show404 = false;

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  List<Book?> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  @override
  BookRoutePath get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    }
    return _selectedBook == null
        ? BookRoutePath.home()
        : BookRoutePath.details(books.indexOf(_selectedBook));
  }

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('BooksListPage'),
          child: BooksListScreen(
            books: books,
            onTapped: _handleBookTapped,
          ),
        ),
        if (show404)
          MaterialPage(
              key: const ValueKey('UnknownPage'), child: UnknownScreen())
        else if (_selectedBook != null)
          MaterialPage(
              key: const ValueKey('BookDetailsScreen'),
              child: BookDetailsScreen(book: _selectedBook))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedBook = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) {
    throw UnimplementedError();
  }
}
