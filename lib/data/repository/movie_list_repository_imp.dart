import 'package:movie_app/data/datasource/tmdb_datasource.dart';
import 'package:movie_app/domain/entities/genre_entity.dart';
import 'package:movie_app/domain/entities/movie_page_entity.dart';
import 'package:movie_app/domain/repositories/movie_list_repository.dart';
import 'package:meta/meta.dart';

class MovieListRepositoryImp extends MovieListRepository {
  MovieListRepositoryImp({@required TMDBDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  final TMDBDatasource _remoteDatasource;

  @override
  Future<MoviePageEntity> getMovieByCategory(
    GenreEntity movieCategory,
  ) async {
    return _remoteDatasource.getMovieByGenreID(movieCategory.id);
  }
}
