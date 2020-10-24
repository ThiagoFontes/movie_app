import 'package:movie_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    double popularity,
    int voteCount,
    bool video,
    String posterPath,
    int id,
    bool adult,
    String backdropPath,
    String originalLanguage,
    String originalTitle,
    List<int> genreIds,
    String title,
    double voteAverage,
    String overview,
    String releaseDate,
  }) : super(
          popularity,
          voteCount,
          video,
          posterPath,
          id,
          adult,
          backdropPath,
          originalLanguage,
          originalTitle,
          genreIds,
          title,
          voteAverage,
          overview,
          releaseDate,
        );

  MovieModel fromJson(Map<String, dynamic> json) {
    return MovieModel(
      popularity: json['popularity'],
      voteCount: json['vote_count'],
      video: json['video'],
      posterPath: json['poster_path'],
      id: json['id'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'].cast<int>(),
      title: json['title'],
      voteAverage: json['vote_average'],
      overview: json['overview'],
      releaseDate: json['release_date'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this.popularity;
    data['vote_count'] = this.voteCount;
    data['video'] = this.video;
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }
}
