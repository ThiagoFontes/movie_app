import 'package:movie_app/data/datasource/tmdb_datasource.dart';
import 'package:movie_app/domain/entities/movie_categories.dart';
import 'package:movie_app/domain/entities/movie_page_entity.dart';

class MovieListRepositoryImp {
  final TMDBDatasource remoteDatasource;
  final Map<MovieCategories, int> movieIdMap = {
    MovieCategories.acao: 28,
  };

  MovieListRepositoryImp(this.remoteDatasource);

  Future<MoviePageEntity> getMovieByCategory(
    MovieCategories movieCategories,
  ) async {
    return remoteDatasource.getMovieByGenreID(movieIdMap[movieCategories]);
  }
}
