import 'package:movie_app/domain/entities/genre_entity.dart';
import 'package:movie_app/domain/entities/movie_page_entity.dart';

abstract class MovieListRepository {
  Future<MoviePageEntity> getMovieByCategory(GenreEntity movieCategories);
}
