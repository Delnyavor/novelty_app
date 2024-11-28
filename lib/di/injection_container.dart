import 'package:get_it/get_it.dart';
import 'package:novelty_app/features/books/data/datasource/book_remote_data_source.dart';
import 'package:novelty_app/features/books/data/datasource/book_remote_data_source_impl.dart';
import 'package:novelty_app/features/books/data/repositories/book_repos_impl.dart';
import 'package:novelty_app/features/books/domain/models/book_model.dart';
import 'package:novelty_app/features/books/domain/repository/book_repository.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  initFeatures();
}

void initFeatures() {
  initBookFeatures();
}

void initBookFeatures() {
  sl.registerLazySingleton<BookRemoteDataSource>(
      () => BookRemoteDataSourceImpl());

  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(sl()));

  sl.registerLazySingleton<BookModel>(() => BookModel(repository: sl()));
}
