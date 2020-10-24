import 'package:movie_app/domain/entities/movie_entity.dart';

class MoviePageEntity {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<MovieEntity> results;

  MoviePageEntity(
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  );
}
