part of 'home_screen_cubit.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenState {}

class FilterCategoryState extends HomeScreenState {
  FilterCategoryState(this.category, this.listOfMovies);

  final GenreEntity category;
  final List<MovieEntity> listOfMovies;

  @override
  List<Object> get props => [category, listOfMovies];
}

class SearchTextState extends HomeScreenState {}
