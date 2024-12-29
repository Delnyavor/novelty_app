import 'package:flutter/material.dart';
import 'package:novelty_app/common/theming/constants.dart';
import 'package:novelty_app/features/books/domain/models/book_model.dart';
import 'package:novelty_app/features/chat/presentation/widgets/thread_widget.dart';
import 'package:provider/provider.dart';

class ThreadPage extends StatefulWidget {
  const ThreadPage({super.key});

  @override
  createState() => _ThreadPage();
}

class _ThreadPage extends State<ThreadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: list(),
    );
  }

  Widget list() {
    return Consumer<BookModel>(
      builder: (BuildContext context, BookModel model, Widget? child) {
        return GridView(
            padding:
                const EdgeInsets.symmetric(horizontal: novPrimaryBodyMargin),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 30,
              childAspectRatio: 2.5,
            ),
            children: model.books.map((e) => ThreadWidget(book: e)).toList());
      },
    );
  }
}
