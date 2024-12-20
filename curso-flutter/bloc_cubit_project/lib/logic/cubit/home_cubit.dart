import 'package:bloc/bloc.dart';
import 'package:bloc_cubit_project/models/movie_model.dart';
import 'package:bloc_cubit_project/services/home_services.dart';

part 'home_states.dart';

//Tipagem do Cubit para garantir que só será lidado com o HomeStates
class HomeCubit extends Cubit<HomeStates> {
  // Estado inicial da HomeScreen
  HomeCubit() : super(HomeInitial());

  final HomeServices homeServices = HomeServices();

  Future<void> findMovies() async {
    emit(
      HomeLoading(),
    );

    try {
      final List<MovieModel> movies = await homeServices.fetchMovies();

      emit(
        HomeSuccess(
          movies: movies,
        ),
      );
    } catch (_) {
      emit(
        HomeError(
          message: 'Não foi possível carregar a lista de filmes...',
        ),
      );
    }
  }

  Future<void> findMoviesByGenre(String genre) async {
    emit(
      HomeLoading(),
    );

    try {
      List<MovieModel> moviesByGenre =
          await homeServices.fetchMoviesByGenre(genre);

      if (moviesByGenre.isEmpty) {
        emit(
          HomeSuccess(
            movies: moviesByGenre,
            message: 'Nenhum filme encontrado...',
          ),
        );
      } else {
        emit(
          HomeSuccess(
            movies: moviesByGenre,
          ),
        );
      }
    } catch (_) {
      emit(
        HomeError(
          message: 'Não há filmes cadastrados com o gênero selecionado...',
        ),
      );
    }
  }
}
