import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  @override
  //TODO: implements props
  List<Object?> get props => [];
}

class GetMoviesEvent extends MoviesEvent{
  final int page;
  GetMoviesEvent({required this.page});
}

class GetCategoriesMoviesEvent extends MoviesEvent{
  GetCategoriesMoviesEvent();
}

class GetMoviesDetailsEvent extends MoviesEvent{
  final int id;
  GetMoviesDetailsEvent({required this.id});
}

class GetMoviesTrailerEvent extends MoviesEvent{
  final int id;
  GetMoviesTrailerEvent({required this.id});
}





