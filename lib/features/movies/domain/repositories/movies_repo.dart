
import 'package:dartz/dartz.dart';

import '../../../../core/core.export.dart';

abstract class MoviesRepositories {
  /// TODO:insert methods here
  Future<Either<Failure, ApiResponse>> getMovies(int page);
  Future<Either<Failure, ApiResponse>> getCategoriesMovies();
  Future<Either<Failure, ApiResponse>> getMoviesDetails(int id);
  Future<Either<Failure, ApiResponse>> getMovieTrailer(int id);
}
