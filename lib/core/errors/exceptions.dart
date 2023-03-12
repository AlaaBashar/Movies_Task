import '../core.export.dart';
class ServerException implements Exception {
  final ApiResponse? moviesErrorModel;

  const ServerException({
    this.moviesErrorModel,
  });
}
