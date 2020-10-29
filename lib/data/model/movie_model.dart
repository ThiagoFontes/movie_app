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
    String voteAverage,
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
      popularity: json['popularity'] as double,
      voteCount: json['vote_count'] as int,
      video: json['video'] as bool,
      posterPath: json['poster_path'] as String,
      id: json['id'] as int,
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'].cast<int>(),
      title: json['title'] as String,
      voteAverage: json['vote_average'].toString(),
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['popularity'] = popularity;
    data['vote_count'] = voteCount;
    data['video'] = video;
    data['poster_path'] = posterPath;
    data['id'] = id;
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['genre_ids'] = genreIds;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    return data;
  }
}
