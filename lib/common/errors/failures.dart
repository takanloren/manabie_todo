import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.details) : super();

  final String details;
}

class DataSourceFailure extends Failure {

  const DataSourceFailure(String details) : super(details);

  @override
  List<Object?> get props => [details];
}