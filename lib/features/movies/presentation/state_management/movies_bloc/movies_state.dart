import 'package:equatable/equatable.dart';



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

   const MoviesState({
    this.status = MoviesStateStatus.initial,
  });

  MoviesState copyWith({
    MoviesStateStatus? status,
  }) {
    return MoviesState(
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,];





}





