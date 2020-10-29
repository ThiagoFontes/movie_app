import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/entities/genre_entity.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/usecases/genre_list_usecase.dart';
import 'package:movie_app/domain/usecases/movie_list_category_usecase.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit({
    @required MovieListCategoryUsecase categoryUsecase,
    @required GenreListUsecase genreUsecase,
  })  : categoryUsecase = categoryUsecase,
        genreUsecase = genreUsecase,
        super(HomeScreenInitial());

  final GenreListUsecase genreUsecase;
  final MovieListCategoryUsecase categoryUsecase;
  final List<GenreEntity> listOfGenres = [];
  final List<MovieEntity> listOfMovies = [];

  GenreEntity currentGenre;

  Future<void> getGenres() async {
    final response = await genreUsecase();

    listOfGenres.addAll(response);

    await setCategory(listOfGenres.first);
  }

  Future<void> setCategory(GenreEntity genreEntity) async {
    currentGenre = genreEntity;
    listOfMovies.clear();

    final response = await categoryUsecase(
      movieCategory: currentGenre,
    );

    listOfMovies.addAll(response.results);

    emit(FilterCategoryState(currentGenre, listOfMovies));
  }
}
