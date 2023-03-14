import '../core.export.dart';
class ServerException implements Exception {
  final ApiResponse? moviesErrorModel;
  final ApiResponse? getCategoriesMoviesErrorModel;
  final ApiResponse? getMoviesDetailsErrorModel;
  final ApiResponse? getMoviesTrailerErrorModel;

  const ServerException({
    this.moviesErrorModel,
    this.getCategoriesMoviesErrorModel,
    this.getMoviesDetailsErrorModel,
    this.getMoviesTrailerErrorModel,
  });
}
