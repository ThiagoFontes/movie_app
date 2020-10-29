import 'package:movie_app/data/datasource/tmdb_datasource.dart';
import 'package:movie_app/domain/entities/movie_categories.dart';
import 'package:movie_app/domain/entities/movie_page_entity.dart';
import 'package:movie_app/domain/repositories/movie_list_repository.dart';
import 'package:meta/meta.dart';

class MovieListRepositoryImp extends MovieListRepository {
  MovieListRepositoryImp({@required TMDBDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  final TMDBDatasource _remoteDatasource;
  final Map<MovieCategories, int> movieIdMap = {
    MovieCategories.acao: 28,
  };

  @override
  Future<MoviePageEntity> getMovieByCategory(
    MovieCategories movieCategories,
  ) async {
    return _remoteDatasource.getMovieByGenreID(movieIdMap[movieCategories]);
  }
}
