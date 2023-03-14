import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int statusCode;
  final dynamic data;

  const Failure({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
        statusCode,
        data,
      ];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.statusCode,
    required super.message,
    required super.data,
  });
}
