import 'package:movie_app/domain/entities/genre_entity.dart';

abstract class GenreListRepository {
  Future<List<GenreEntity>> getGenres();
}
