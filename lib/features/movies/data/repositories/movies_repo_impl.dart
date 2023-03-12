import 'package:dartz/dartz.dart';

import '../../../../core/core.export.dart';
import '../../movies.export.dart';

class MoviesRepositoriesImpl extends MoviesRepositories{
  final MoviesRemoteData? moviesRemoteData;

  MoviesRepositoriesImpl({this.moviesRemoteData});
  @override
  Future<Either<Failure, ApiResponse>> getMovies() async{
    final ApiResponse apiResponse;
    try {
      apiResponse = await moviesRemoteData!.getMovie();
      return Right(apiResponse);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        statusCode: failure.moviesErrorModel!.statusCode!,
        message: failure.moviesErrorModel!.message.toString(),
        data: failure.moviesErrorModel!.data!,
      ),);
    }
  }
}