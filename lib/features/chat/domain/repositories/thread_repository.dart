import 'package:novelty_app/error/failures.dart';
import 'package:novelty_app/features/chat/domain/entities/thread.dart';
import 'package:dartz/dartz.dart';

abstract class ThreadRepository {
  Future<Either<Failure, List<Thread>?>?> fetchThreads();
  Future<Either<Failure, Thread>?> addThread();
  Future<Either<Failure, Thread>?> deleteThread();
}
