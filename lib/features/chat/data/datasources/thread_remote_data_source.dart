import 'package:novelty_app/features/chat/domain/entities/thread.dart';

abstract class ThreadRemoteDataSource {
  ///gets the cached [Thread] saved on the local device
  ///
  ///Throws [CacheException] if not data is present
  Future<List<Thread>?>? getAllThreads();

  ///saves the [Thread] onto the local device
  ///
  ///Throws [CacheException] if not data is present
  Future<Thread?>? createThread(Thread thread);

  ///gets the cached [Thread] saved on the local device
  ///
  ///Throws [CacheException] if not data is present
  Future<Thread?>? getThread(int id);

  ///modifies the cached [Thread] saved on the local device
  ///
  ///Throws [CacheException] if not data is present
  Future<Thread?>? updateThread(Thread thread);

  ///deletes the cached [Thread] saved on the local device
  ///
  ///Throws [CacheException] if not data is present
  Future<bool?>? deleteThread(int id);

  ///checks the local database for any unsynced data and
  ///pushes them to the remote store
  ///
}
