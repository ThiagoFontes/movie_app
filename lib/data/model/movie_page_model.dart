import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
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
    final results = new List<MovieModel>();

    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(new MovieModel().fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) {
        return (v as MovieModel).toJson();
      }).toList();
    }
    return data;
  }
}
