import 'package:movie_app/domain/entities/genre_entity.dart';

class GenreModel extends GenreEntity {
  GenreModel({int id, String name}) : super(id, name);

  GenreModel fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
