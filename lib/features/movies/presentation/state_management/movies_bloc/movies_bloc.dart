import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../movies.export.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesUseCases moviesUseCases;
  MoviesBloc({required this.moviesUseCases}) : super(const MoviesState()) {
    on<GetMoviesEvent>(_getMovies);
  }
  static MoviesBloc get(context) => BlocProvider.of(context);

  void _getMovies(GetMoviesEvent event, Emitter<MoviesState> emit) {}



}
