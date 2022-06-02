import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.id) : super();

  final int id;
}

class DataSourceFailure extends Failure {

  const DataSourceFailure(int id) : super(id);

  @override
  List<Object?> get props => [id];
}