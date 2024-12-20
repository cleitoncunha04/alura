import 'package:bloc_cubit_project/models/movie_model.dart';
import 'package:bloc_cubit_project/screens/checkout_screen.dart';
import 'package:flutter/material.dart';

class TabBarMovieComponent extends StatelessWidget {
  const TabBarMovieComponent({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Ink(
              height: 45,
              child: const TabBar(
                tabs: [
                  Tab(text: 'Sessões'),
                  Tab(text: 'Detalhes'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      _MovieSessionComponent(
                        movie: movie,
                      ),
                    ],
                  ),
                  ListView(
                    children: [
                      _MovieDetailComponent(
                        sinopse: movie.sinopse,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieDetailComponent extends StatelessWidget {
  const _MovieDetailComponent({required this.sinopse});
  final String? sinopse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sinopse:',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
          ),
          child: Text(
            sinopse ?? 'Sinopse Indispobível.',
          ),
        ),
      ],
    );
  }
}

class _MovieSessionComponent extends StatelessWidget {
  const _MovieSessionComponent({required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return movie.sessions != null
        ? Wrap(
            spacing: 2.0,
            children: movie.sessions!
                .map(
                  (session) => Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutScreen(
                              movie: movie,
                              session: session,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 60,
                        height: 40,
                        child: Center(
                          child: Text(
                            session,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        : const Column(
            children: [
              Icon(
                Icons.error,
                size: 30,
              ),
              Text(
                'Não há sessões disponíveis',
              ),
            ],
          );
  }
}
