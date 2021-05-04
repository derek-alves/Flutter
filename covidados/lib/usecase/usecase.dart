import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'errors/serverFailure.dart';

abstract class Usecase<Output, Input> {
  Future<Either<ServerFailure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
