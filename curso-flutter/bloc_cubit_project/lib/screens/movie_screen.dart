import 'package:bloc_cubit_project/components/movie_screen_components/poster_card_component.dart';
import 'package:bloc_cubit_project/components/movie_screen_components/poster_component.dart';
import 'package:bloc_cubit_project/components/movie_screen_components/tab_bar_movie_component.dart';
import 'package:bloc_cubit_project/logic/cubit/my_themes_cubit.dart';
import 'package:bloc_cubit_project/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    // Lendo o Provider do BloC
    final MyThemeCubit myThemeCubit = context.read<MyThemeCubit>();

    myThemeCubit.changeTheme(movie.genre);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                PosterComponent(
                  imageURL: movie.imageURI,
                ),
                PosterCardComponent(
                  title: movie.name,
                  genre: movie.genre,
                  classification: movie.classification,
                  duration: movie.duration,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarMovieComponent(
              movie: movie,
            ),
          ),
        ],
      ),
    );
  }
}
