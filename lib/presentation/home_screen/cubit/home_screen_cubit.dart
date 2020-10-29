import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/movie_categories.dart';
import 'package:movie_app/domain/usecases/movie_list_category_usecase.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit({
    @required MovieListCategoryUsecase categoryUsecase,
  })  : categoryUsecase = categoryUsecase,
        super(HomeScreenInitial());

  final MovieListCategoryUsecase categoryUsecase;

  MovieCategories currentCategory = MovieCategories.acao;

  Future<void> setCategory(MovieCategories category) async {
    currentCategory = category;
    emit(FilterCategoryState(category));
  }
}
