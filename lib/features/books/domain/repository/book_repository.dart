import 'package:novelty_app/error/failures.dart';
import 'package:novelty_app/features/books/domain/entities/book.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>?>?> fetchBooks();
  Future<Either<Failure, Book>?> addBook();
  Future<Either<Failure, Book>?> deleteBook();
}
