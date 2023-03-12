
import 'package:dartz/dartz.dart';

import '../../../../core/core.export.dart';

abstract class MoviesRepositories {
  /// TODO:insert methods here
  Future<Either<Failure, ApiResponse>> getMovies();
}
