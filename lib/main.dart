import 'package:flutter/material.dart';
import 'package:novelty_app/common/routes/routes.dart';
import 'package:novelty_app/common/theming/app_themes.dart';
import 'package:novelty_app/common/transitions/route_transitions.dart';
import 'package:novelty_app/di/injection_container.dart';
import 'package:novelty_app/features/app/presentation/pages/app_page.dart';
import 'package:novelty_app/features/books/domain/models/book_model.dart';
import 'package:novelty_app/features/books/domain/repository/book_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BookModel(repository: sl<BookRepository>()))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  void push(context) {
    Navigator.push(
      context,
      fadeInRoute(const AppPage(
        appPageRoute: AppRoutes.homeRoutePrefix,
      )),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<BookModel>(context, listen: false).fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BookModel>(
        builder: (BuildContext context, BookModel model, Widget? child) {
          debugPrint("loading: ${model.isLoading}");
          if (model.books.isNotEmpty) {
            Future.delayed(const Duration(seconds: 2), () {
              push(context);
            });
          }
          return Center(
              child: TextButton(
            onPressed: () {
              push(context);
            },
            child: const Text('Enter'),
          ));
        },
      ),
    );
  }
}
