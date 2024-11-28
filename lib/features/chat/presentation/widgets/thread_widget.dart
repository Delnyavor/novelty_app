import 'package:flutter/material.dart';
import 'package:novelty_app/features/books/domain/entities/book.dart';

class ThreadWidget extends StatelessWidget {
  final Book book;

  const ThreadWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return ListTile(
      leading: leading(),
      title: Text(book.title),
    );
  }

  Widget leading() {
    return CircleAvatar(
      backgroundColor: Colors.cyan,
      foregroundImage: NetworkImage(book.cover),
    );
  }
}
