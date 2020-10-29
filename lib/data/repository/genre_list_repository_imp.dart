import 'package:movie_app/data/datasource/tmdb_datasource.dart';
import 'package:movie_app/domain/entities/genre_entity.dart';
import 'package:movie_app/domain/repositories/genre_list_repository.dart';

class GenreListRepositoryImp extends GenreListRepository {
  GenreListRepositoryImp(this._remoteDatasource);

  final TMDBDatasource _remoteDatasource;

  @override
  Future<List<GenreEntity>> getGenres() async {
    return await _remoteDatasource.getGenreList();
  }
}
