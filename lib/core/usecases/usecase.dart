import 'package:dartz/dartz.dart';
import 'package:dhikr_reminder/core/error/failures.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Result, Params> {
  Future<Either<Failure, Result>> call(Params params);
}

abstract class UseCaseNoParam<Result> {
  Future<Either<Failure, Result>> call();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
