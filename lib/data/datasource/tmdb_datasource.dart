import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/model/genre_model.dart';
import 'package:movie_app/data/model/movie_page_model.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/entities/genre_entity.dart';

class TMDBDatasource {
  final http.Client _client;

  final baseURL = 'https://api.themoviedb.org/3';

  final apiKey = 'api_key=6360a5ff49a2c17cb0db3072cdb4dcfa';

  TMDBDatasource({@required http.Client client}) : _client = client;

  Future<List<GenreEntity>> getGenreList() async {
    final response = await _client.get(
      '${baseURL}/genre/movie/list?${apiKey}&language=pt-BR',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final genres = <GenreModel>[];

      if (jsonDecode(response.body)['genres'] != null) {
        jsonDecode(response.body)['genres'].forEach((v) {
          genres.add(GenreModel().fromJson(v));
        });
      }

      return genres;
    } else {
      throw Exception();
    }
  }

  Future<MoviePageModel> getMovieByGenreID(int id) async {
    final response = await _client.get(
      '${baseURL}/discover/movie?${apiKey}&with_genres=${id}',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return MoviePageModel().fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
