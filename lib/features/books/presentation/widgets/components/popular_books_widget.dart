import 'package:flutter/material.dart';
import 'package:novelty_app/common/transitions/route_transitions.dart';
import 'package:novelty_app/features/books/domain/entities/book.dart';
import 'package:novelty_app/features/books/presentation/pages/book_details.dart';

class PopularBooksWidget extends StatefulWidget {
  final Book book;
  const PopularBooksWidget({super.key, required this.book});

  @override
  State<PopularBooksWidget> createState() => _PopularBooksWidgetState();
}

class _PopularBooksWidgetState extends State<PopularBooksWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, slideInRoute(BookDetailsPage(book: widget.book)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          imageWidget(),
          const SizedBox(height: 20),
          descriptors(),
        ],
      ),
    );
  }

  Widget imageWidget() {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: -12,
            blurRadius: 6,
            offset: Offset(-15, 15),
            color: Colors.black12,
          ),
          BoxShadow(
            spreadRadius: -10,
            blurRadius: 8,
            offset: Offset(-20, 22),
            color: Colors.black26,
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
        child: Image.network(
          widget.book.cover,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget descriptors() => Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.book.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
                // fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.1,
                height: 1.5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              widget.book.rating.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
                // fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.1,
                height: 1.5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}
