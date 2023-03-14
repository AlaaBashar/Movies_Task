import 'package:dartz/dartz.dart';

import '../../../../core/core.export.dart';
import '../../movies.export.dart';

class MoviesRepositoriesImpl extends MoviesRepositories{
  final MoviesRemoteData? moviesRemoteData;

  MoviesRepositoriesImpl({this.moviesRemoteData});
  @override
  Future<Either<Failure, ApiResponse>> getMovies(int page) async{
    final ApiResponse apiResponse;
    try {
      apiResponse = await moviesRemoteData!.getMovie(page);
      return Right(apiResponse);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        statusCode: failure.moviesErrorModel!.statusCode!,
        message: '',
        data: failure.moviesErrorModel!.data!,
      ),);
    }
  }
  @override
  Future<Either<Failure, ApiResponse>> getCategoriesMovies() async{
    final ApiResponse apiResponse;
    try {
      apiResponse = await moviesRemoteData!.getCategoriesMovies();
      return Right(apiResponse);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        statusCode: failure.getCategoriesMoviesErrorModel!.statusCode!,
        message: '',
        data: failure.getCategoriesMoviesErrorModel!.data!,
      ),);
    }
  }
  @override
  Future<Either<Failure, ApiResponse>> getMoviesDetails(int id) async{
    final ApiResponse apiResponse;
    try {
      apiResponse = await moviesRemoteData!.getMoviesDetails(id);
      return Right(apiResponse);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        statusCode: failure.getMoviesDetailsErrorModel!.statusCode!,
        message: '',
        data: failure.getMoviesDetailsErrorModel!.data!,
      ),);
    }
  }
  @override
  Future<Either<Failure, ApiResponse>> getMovieTrailer(int id) async{
    final ApiResponse apiResponse;
    try {
      apiResponse = await moviesRemoteData!.getMoviesTrailer(id);
      return Right(apiResponse);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        statusCode: failure.getMoviesTrailerErrorModel!.statusCode!,
        message: '',
        data: failure.getMoviesTrailerErrorModel!.data!,
      ),);
    }
  }
}