import 'package:bloc_cubit_project/models/movie_model.dart';
import 'package:bloc_cubit_project/screens/movie_screen.dart';
import 'package:flutter/material.dart';

class MovieCardComponent extends StatelessWidget {
  const MovieCardComponent({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 200,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieScreen(
                      movie: movie,
                    ),
                  ),
                );
              },
              child: Ink(
                width: double.infinity,
                child: Image.network(
                  movie.imageURI!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProcess) {
                    return loadingProcess == null
                        ? child
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  },
                  errorBuilder: (_, __, ___) => Ink(
                    child: const Center(
                      child: SizedBox(
                        height: 255,
                        child: Icon(
                          Icons.error,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          movie.name,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
