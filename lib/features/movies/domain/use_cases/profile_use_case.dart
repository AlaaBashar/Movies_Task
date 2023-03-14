import 'package:dartz/dartz.dart';
import '../../../../core/core.export.dart';
import '../domain.export.dart';


class MoviesUseCases {
  final MoviesRepositories moviesRepositories;
  MoviesUseCases({required this.moviesRepositories});

  Future<Either<Failure, ApiResponse>> getMovies(int page) async {
    return await moviesRepositories.getMovies(page);
  }
  Future<Either<Failure, ApiResponse>> getCategoriesMovies() async {
    return await moviesRepositories.getCategoriesMovies();
  }
  Future<Either<Failure, ApiResponse>> getMoviesDetails(int id) async {
    return await moviesRepositories.getMoviesDetails(id);
  }
  Future<Either<Failure, ApiResponse>> getMovieTrailer(int id) async {
    return await moviesRepositories.getMovieTrailer(id);
  }
}
