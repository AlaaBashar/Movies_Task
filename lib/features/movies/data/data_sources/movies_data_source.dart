import '../../../../core/core.export.dart';


abstract class MoviesRemoteData {
  Future<ApiResponse> getMovie(int page);
  Future<ApiResponse> getCategoriesMovies();
  Future<ApiResponse> getMoviesDetails(int id);
  Future<ApiResponse> getMoviesTrailer(int id);
}
class MoviesRemoteDataImpl implements MoviesRemoteData{
  final DioNetworkInterface dioNetworkInterface;
  MoviesRemoteDataImpl({required this.dioNetworkInterface});

  @override
  Future<ApiResponse> getMovie(int page) async{
    ApiResponse apiResponse = await dioNetworkInterface.get(
      NetworkLinks.getPopularMovies,
      queryParameters: {
        "page":page.toString(),
      }
    );

    if(apiResponse.statusCode == 200){
      return apiResponse;
    }
    else{
      throw ServerException(moviesErrorModel:apiResponse);

    }


  }
  @override
  Future<ApiResponse> getCategoriesMovies() async{
    ApiResponse apiResponse = await dioNetworkInterface.get(
        NetworkLinks.getCategoriesMovies,
    );
    if(apiResponse.statusCode == 200){
      return apiResponse;
    }
    else{
      throw ServerException(getCategoriesMoviesErrorModel:apiResponse);

    }

  }
  @override
  Future<ApiResponse> getMoviesDetails(int id) async{
    ApiResponse apiResponse = await dioNetworkInterface.get(
      NetworkLinks.getVideoDetails(id),
    );
    if(apiResponse.statusCode == 200){
      return apiResponse;
    }
    else{
      throw ServerException(getMoviesDetailsErrorModel:apiResponse);

    }

  }
  @override
  Future<ApiResponse> getMoviesTrailer(int id) async{
    ApiResponse apiResponse = await dioNetworkInterface.get(
      NetworkLinks.getMovieTrailer(id),
    );
    if(apiResponse.statusCode == 200){
      return apiResponse;
    }
    else{
      throw ServerException(getMoviesTrailerErrorModel:apiResponse);

    }

  }
}