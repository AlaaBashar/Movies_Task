import 'package:equatable/equatable.dart';

import '../../../../features.export.dart';



enum MoviesStateStatus { initial, success, error, loading, selected }

extension MoviesStateStatusX on MoviesStateStatus {
  bool get isInitial => this == MoviesStateStatus.initial;
  bool get isSuccess => this == MoviesStateStatus.success;
  bool get isError => this == MoviesStateStatus.error;
  bool get isLoading => this == MoviesStateStatus.loading;
  bool get isSelected => this == MoviesStateStatus.selected;
}


class MoviesState extends Equatable{
  final MoviesStateStatus status;
  final List<MoviesListModel> moviesList;
  final List<CategoriesMoviesModel> categoriesMoviesList;
  final List<MoviesDetailsModel> moviesDetailsModelList;
  final List<TrailerMoviesModel> trailerMoviesModelList;
   const MoviesState({
    this.status = MoviesStateStatus.initial,
    this.moviesList = const[],
    this.categoriesMoviesList = const[],
    this.moviesDetailsModelList = const[],
    this.trailerMoviesModelList = const[],
  });

  MoviesState copyWith({
    MoviesStateStatus? status,
    List<MoviesListModel>? moviesList,
    List<CategoriesMoviesModel>? categoriesMoviesList,
    List<MoviesDetailsModel>? moviesDetailsModelList,
    List<TrailerMoviesModel>? trailerMoviesModelList
  }) {
    return MoviesState(
      status: status ?? this.status,
      moviesList: moviesList ?? this.moviesList,
      categoriesMoviesList: categoriesMoviesList ?? this.categoriesMoviesList,
      moviesDetailsModelList: moviesDetailsModelList ?? this.moviesDetailsModelList,
      trailerMoviesModelList: trailerMoviesModelList ?? this.trailerMoviesModelList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        moviesList,
        categoriesMoviesList,
        moviesDetailsModelList,
        trailerMoviesModelList,
      ];
}





