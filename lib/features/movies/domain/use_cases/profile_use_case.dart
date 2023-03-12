import 'package:dartz/dartz.dart';
import '../../../../core/core.export.dart';
import '../domain.export.dart';


class MoviesUseCases {
  final MoviesRepositories moviesRepositories;
  MoviesUseCases({required this.moviesRepositories});

  Future<Either<Failure, ApiResponse>> getMovies() async {
    return await moviesRepositories.getMovies();
  }
}
