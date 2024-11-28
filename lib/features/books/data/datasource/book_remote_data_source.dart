import 'package:novelty_app/features/books/domain/entities/book.dart';

abstract class BookRemoteDataSource {
  ///gets the cached [Book] saved on the local device
  ///
  ///Throws [CacheException] if not data is present
  Future<List<Book>?>? getAllBooks();

  ///saves the [Book] onto the local device
  ///
  ///Throws [CacheException] if not data is present
  Future<Book?>? createBook(Book book);

  ///gets the cached [Book] saved on the local device
  ///
  ///Throws [CacheException] if not data is present
  Future<Book?>? getBook(int id);

  ///modifies the cached [Book] saved on the local device
  ///
  ///Throws [CacheException] if not data is present
  Future<Book?>? updateBook(Book book);

  ///deletes the cached [Book] saved on the local device
  ///
  ///Throws [CacheException] if not data is present
  Future<bool?>? deleteBook(int id);

  ///checks the local database for any unsynced data and
  ///pushes them to the remote store
  ///
}
