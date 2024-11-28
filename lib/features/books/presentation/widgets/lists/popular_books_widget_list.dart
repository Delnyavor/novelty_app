import 'package:flutter/material.dart';
import 'package:novelty_app/common/theming/constants.dart';
import 'package:novelty_app/common/widgets/title.dart';
import 'package:novelty_app/features/books/domain/models/book_model.dart';
import 'package:novelty_app/features/books/presentation/widgets/components/popular_books_widget.dart';
import 'package:provider/provider.dart';

class PopularBooksList extends StatelessWidget {
  const PopularBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return buildContents(context);
  }

  Widget buildContents(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: novPrimaryBodyMargin,
            bottom: novTitleMargin,
            // right: novTitleMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SectionTitle(
                text: 'Popular Books',
              ),
              TextButton(
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.resolveWith(
                    (states) => const Size(10, 20),
                  ),
                  padding: WidgetStateProperty.resolveWith(
                      (states) => const EdgeInsets.all(5)),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_forward_rounded,
                ),
              ),
            ],
          ),
        ),
        // ignore: sized_box_for_whitespace
        Container(
          // color: Colors.green[100],
          // padding: const EdgeInsets.symmetric(vertical: 10.0),
          // child: AspectRatio(aspectRatio: 1.4, child: list()),
          height: 300,
          child: list(),
        )
      ],
    );
  }

  Widget list() {
    return Consumer<BookModel>(
        builder: (BuildContext context, BookModel model, Widget? child) {
      return GridView(
          padding: const EdgeInsets.symmetric(horizontal: novPrimaryBodyMargin),
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 30,
            childAspectRatio: 2.5,
          ),
          children: model.books
              .map((e) => PopularBooksWidget(
                    book: e,
                  ))
              .toList());
    });
  }
}
