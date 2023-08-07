import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  const Failure([this.properties = const []]);
}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [properties];
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [properties];
}
