import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/domain/entities/movie_page_entity.dart';

class MoviePageModel extends MoviePageEntity {
  MoviePageModel({
    int page,
    int totalResults,
    int totalPages,
    List<MovieModel> results,
  }) : super(
          page,
          totalResults,
          totalPages,
          results,
        );

  MoviePageModel fromJson(Map<String, dynamic> json) {
    final results = <MovieModel>[];

    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(MovieModel().fromJson(v));
      });
    }

    return MoviePageModel(
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      results: results,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    if (results != null) {
      data['results'] = results.map((v) {
        return (v as MovieModel).toJson();
      }).toList();
    }
    return data;
  }
}
