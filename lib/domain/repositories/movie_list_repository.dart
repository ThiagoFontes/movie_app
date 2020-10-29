import 'package:movie_app/domain/entities/movie_categories.dart';
import 'package:movie_app/domain/entities/movie_page_entity.dart';

abstract class MovieListRepository {
  Future<MoviePageEntity> getMovieByCategory(MovieCategories movieCategories);
}
