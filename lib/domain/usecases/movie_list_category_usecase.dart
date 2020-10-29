import 'package:movie_app/domain/entities/genre_entity.dart';
import 'package:movie_app/domain/entities/movie_page_entity.dart';
import 'package:movie_app/domain/repositories/movie_list_repository.dart';
import 'package:meta/meta.dart';

class MovieListCategoryUsecase {
  const MovieListCategoryUsecase({@required MovieListRepository repository})
      : _repository = repository;

  final MovieListRepository _repository;

  Future<MoviePageEntity> call({GenreEntity movieCategory}) async {
    return await _repository.getMovieByCategory(movieCategory);
  }
}
