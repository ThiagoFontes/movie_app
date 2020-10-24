import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/model/movie_page_model.dart';

class TMDBDatasource {
  final http.Client client;

  final baseURL =
      'https://api.themoviedb.org/3/discover/movie?api_key=6360a5ff49a2c17cb0db3072cdb4dcfa';

  TMDBDatasource(this.client);

  Future<MoviePageModel> getMovieByGenreID(int id) async {
    final response = await client.get(
      '$baseURL&with_genres=$id',
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
