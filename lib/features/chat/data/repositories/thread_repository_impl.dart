import 'package:dartz/dartz.dart';
import 'package:novelty_app/error/exception_handler.dart';
import 'package:novelty_app/error/failures.dart';
import 'package:novelty_app/features/chat/data/datasources/thread_remote_data_source.dart';
import 'package:novelty_app/features/chat/domain/entities/thread.dart';
import 'package:novelty_app/features/chat/domain/repositories/thread_repository.dart';

class ThreadRepositoryImpl extends ThreadRepository {
  ThreadRemoteDataSource dataSource;

  ThreadRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Thread>?> addThread() {
    // TODO: implement addThread
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Thread>?> deleteThread() {
    // TODO: implement deleteThread
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Thread>?>?> fetchThreads() async {
    try {
      List<Thread>? data = await dataSource.getAllThreads();
      return Right(data);
    } on Exception catch (e) {
      return Left(handleException(e));
    }
  }
}
