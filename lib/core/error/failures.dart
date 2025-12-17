import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String error;

  const Failure({required this.error});
  @override
  List<Object?> get props => [error];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.error});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.error});
}
