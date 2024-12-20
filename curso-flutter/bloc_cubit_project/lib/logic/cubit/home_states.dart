part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
  HomeSuccess({
    required this.movies,
    this.message,
  });

  final List<MovieModel> movies;
  final String? message;
}

class HomeError extends HomeStates {
  HomeError({
    required this.message,
  });

  final String message;
}
