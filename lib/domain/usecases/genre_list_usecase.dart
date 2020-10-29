import 'package:movie_app/domain/entities/genre_entity.dart';
import 'package:movie_app/domain/repositories/genre_list_repository.dart';

class GenreListUsecase {
  GenreListUsecase(this.repository);

  final GenreListRepository repository;

  Future<List<GenreEntity>> call() async {
    return await repository.getGenres();
  }
}
