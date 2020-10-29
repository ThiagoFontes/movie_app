import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_categories.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/usecases/movie_list_category_usecase.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit({
    @required MovieListCategoryUsecase categoryUsecase,
  })  : categoryUsecase = categoryUsecase,
        super(HomeScreenInitial());

  final MovieListCategoryUsecase categoryUsecase;
  final List<MovieEntity> listOfMovies = [];

  MovieCategories currentCategory;

  Future<void> setCategory(MovieCategories category) async {
    currentCategory = category;
    listOfMovies.clear();

    final response = await categoryUsecase(
      movieCategory: currentCategory,
    );

    listOfMovies.addAll(response.results);

    emit(FilterCategoryState(category, listOfMovies));
  }
}
