import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

class ApiResponseFailure extends Failure {
  const ApiResponseFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure()
      : super('Connection error. Verify your internet and try again.');
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
