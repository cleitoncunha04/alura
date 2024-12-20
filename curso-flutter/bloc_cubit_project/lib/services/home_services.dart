import 'dart:convert';

import 'package:bloc_cubit_project/models/movie_model.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  Future<List<MovieModel>> fetchMovies() async {
    final response = await http.get(
      Uri.parse(
          'https://raw.githubusercontent.com/alura-cursos/3033-bloc-com-cubit/main/lib/movies.json'),
    );

    final json = jsonDecode(response.body);

    return List<MovieModel>.from(
      json['filmes'].map(
        (elemento) {
          return MovieModel.fromJson(elemento);
        },
      ),
    );
  }

  Future<List<MovieModel>> fetchMoviesByGenre(String genre) async {
    final response = await http.get(
      Uri.parse(
          'https://raw.githubusercontent.com/alura-cursos/3033-bloc-com-cubit/main/lib/movies.json'),
    );

    final json = jsonDecode(response.body);

    final list = List<MovieModel>.from(
      json['filmes'].map(
        (elemento) {
          return MovieModel.fromJson(elemento);
        },
      ),
    );

    return list.where((element) => element.genre == genre).toList();
  }
}
