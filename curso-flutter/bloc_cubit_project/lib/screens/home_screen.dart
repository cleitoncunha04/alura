import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_cubit_project/components/home_screen_components/genre_filter_component.dart';
import 'package:bloc_cubit_project/components/movie_card_component.dart';
import 'package:bloc_cubit_project/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    homeCubit.findMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Text(
                  "Filmes",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              GenreFilterComponent(
                homeCubit: homeCubit,
              ),
              BlocBuilder<HomeCubit, HomeStates>(
                bloc: homeCubit,
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else if (state is HomeSuccess) {
                    if (state.message != null) {
                      return const SliverFillRemaining(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(24),
                              child: Icon(
                                Icons.not_interested,
                                size: 32,
                              ),
                            ),
                            Text(
                              'Nenhum filme encontrado...',
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisExtent: 320,
                        ),
                        itemBuilder: (context, index) {
                          return MovieCardComponent(
                            movie: state.movies[index],
                          );
                        },
                        itemCount: state.movies.length,
                      );
                    }
                  } else if (state is HomeError) {
                    return SliverFillRemaining(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(24),
                            child: Icon(
                              Icons.error,
                              size: 32,
                            ),
                          ),
                          Text(
                            state.message,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
