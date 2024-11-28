import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:novelty_app/features/books/domain/entities/book.dart';
import 'package:novelty_app/features/books/domain/repository/book_repository.dart';

class BookModel extends ChangeNotifier {
  List<Book> _books;
  UnmodifiableListView<Book> get books => UnmodifiableListView(_books);

  bool isLoading = true;

  BookRepository repository;

  BookModel({
    required this.repository,
    List<Book>? books,
  }) : _books = books ?? [];

  Future<void> fetchBooks() async {
    isLoading = true;
    var data = await repository.fetchBooks();
    data!.fold((l) => (null), (r) => (_books = r!));
    isLoading = false;
    notifyListeners();
  }
}
