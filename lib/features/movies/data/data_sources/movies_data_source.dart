import '../../../../core/core.export.dart';


abstract class MoviesRemoteData {
  Future<ApiResponse> getMovie();
}
class MoviesRemoteDataImpl implements MoviesRemoteData{
  final DioNetworkInterface? dioNetworkInterface;
  MoviesRemoteDataImpl({this.dioNetworkInterface});

  @override
  Future<ApiResponse> getMovie() {
    // TODO: implement getMovie
    throw UnimplementedError();
  }

}