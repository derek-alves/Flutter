import 'package:flutter/material.dart';
import 'package:routeapi2/screens/book_detail_screen.dart';
import 'package:routeapi2/screens/books_list_screen.dart';
import 'package:routeapi2/screens/unknown_screen.dart';

import 'models/book_model.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  bool show404 = false;
  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];
  late Book? _selectedBook = books[0];
  @override
  void initState() {
    super.initState();
  }

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
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
                key: ValueKey(_selectedBook),
                child: BookDetailsScreen(
                  book: _selectedBook,
                ))
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          setState(() {
            _selectedBook = null;
          });

          return true;
        },
      ),
    );
  }
}
