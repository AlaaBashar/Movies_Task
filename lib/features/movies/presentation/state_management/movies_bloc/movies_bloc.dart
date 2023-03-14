import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.export.dart';
import '../../../movies.export.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesUseCases moviesUseCases;
  MoviesBloc({required this.moviesUseCases}) : super(const MoviesState()) {
    on<GetMoviesEvent>(_getMovies);
    on<GetCategoriesMoviesEvent>(_getCategoriesMovies);
    on<GetMoviesDetailsEvent>(_getMoviesDetails);
    on<GetMoviesTrailerEvent>(_getMoviesTrailer);
  }
  static MoviesBloc get(context) => BlocProvider.of(context);

  void _getMovies(GetMoviesEvent event, Emitter<MoviesState> emit) async{
    int page = event.page;
    List<MoviesListModel> moviesList = [];
    Either<Failure, ApiResponse> result;

    result = await moviesUseCases.getMovies(page);
    result.fold(
          (l) {
        if (l.statusCode == 404 || l.statusCode == 401) {
          emit(state.copyWith(status: MoviesStateStatus.error));
        }
      },
          (r) {
        if (r.statusCode == 200) {
          moviesList.add(MoviesListModel.fromJson(r.data as Map<String,dynamic>));
          emit(state.copyWith(status: MoviesStateStatus.success,moviesList:moviesList));
        }
      },
    );
  }

  void _getCategoriesMovies(GetCategoriesMoviesEvent event, Emitter<MoviesState> emit) async{
    List<CategoriesMoviesModel> categoriesMoviesList = [];
    Either<Failure, ApiResponse> result;
    result = await moviesUseCases.getCategoriesMovies();
    result.fold(
          (l) {
        if (l.statusCode == 404 || l.statusCode == 401) {
          emit(state.copyWith(status: MoviesStateStatus.error));
        }
      },
          (r) {
        if (r.statusCode == 200) {
          categoriesMoviesList.add(CategoriesMoviesModel.fromJson(r.data as Map<String,dynamic>));
          emit(state.copyWith(status: MoviesStateStatus.success,categoriesMoviesList: categoriesMoviesList));
        }
      },
    );
  }

  void _getMoviesDetails(GetMoviesDetailsEvent event, Emitter<MoviesState> emit) async{
    int id =event.id;
    List<MoviesDetailsModel> moviesDetailsModelList=[];
    Either<Failure, ApiResponse> result;
    result = await moviesUseCases.getMoviesDetails(id);
    result.fold(
          (l) {
        if (l.statusCode == 404 || l.statusCode == 401) {
          emit(state.copyWith(status: MoviesStateStatus.error));
        }
      },
          (r) {
        if (r.statusCode == 200) {
          moviesDetailsModelList.add(MoviesDetailsModel.fromJson(r.data));
          emit(state.copyWith(status: MoviesStateStatus.success,moviesDetailsModelList:moviesDetailsModelList));
        }
      },
    );

  }

  void _getMoviesTrailer(GetMoviesTrailerEvent event, Emitter<MoviesState> emit) async{
    int id =event.id;
    List<TrailerMoviesModel> trailerMoviesModelList=[];
    Either<Failure, ApiResponse> result;
    result = await moviesUseCases.getMovieTrailer(id);
    result.fold(
          (l) {
        if (l.statusCode == 404 || l.statusCode == 401) {
          emit(state.copyWith(status: MoviesStateStatus.error));
        }
      },
          (r) {
        if (r.statusCode == 200) {
          trailerMoviesModelList.add(TrailerMoviesModel.fromJson(r.data));
          emit(state.copyWith(status: MoviesStateStatus.success,trailerMoviesModelList:trailerMoviesModelList));
        }
      },
    );
  }
}
