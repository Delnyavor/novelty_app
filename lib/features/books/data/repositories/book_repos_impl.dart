import 'package:dartz/dartz.dart';
import 'package:novelty_app/error/exception_handler.dart';
import 'package:novelty_app/error/failures.dart';
import 'package:novelty_app/features/books/data/datasource/book_remote_data_source.dart';
import 'package:novelty_app/features/books/domain/entities/book.dart';
import 'package:novelty_app/features/books/domain/repository/book_repository.dart';

class BookRepositoryImpl extends BookRepository {
  BookRemoteDataSource dataSource;

  BookRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Book>?> addBook() {
    // TODO: implement addBook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Book>?> deleteBook() {
    // TODO: implement deleteBook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>?>?> fetchBooks() async {
    try {
      List<Book>? data = await dataSource.getAllBooks();
      return Right(data);
    } on Exception catch (e) {
      return Left(handleException(e));
    }
  }
}
