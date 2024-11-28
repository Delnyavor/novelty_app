

import 'package:novelty_app/error/exceptions.dart';
import 'package:novelty_app/error/failures.dart';

Failure handleException(Exception e) {
  switch (e.runtimeType) {
    case const (ServerException):
      return ServerFailure(message: e.toString());

    case const (CacheException):
      return CacheFailure(message: e.toString());

    default:
      return const GenericOperationFailure(
          message: 'An error occurred, plese try again in a few minutes');
  }
}
