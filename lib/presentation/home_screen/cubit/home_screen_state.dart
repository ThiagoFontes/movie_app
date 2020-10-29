part of 'home_screen_cubit.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenState {}

class FilterCategoryState extends HomeScreenState {
  FilterCategoryState(this.category);

  final MovieCategories category;

  @override
  List<Object> get props => [category];
}

class SearchTextState extends HomeScreenState {}
