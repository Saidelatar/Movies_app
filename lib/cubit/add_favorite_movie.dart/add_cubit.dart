import 'package:bloc/bloc.dart';
import 'package:movies_app/cubit/add_favorite_movie.dart/movie_states.dart';
import 'package:movies_app/models/movies.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(AddMovieIntial());

  List<Movies> movies = [];

  AddMovies(Movies movie) {
    try {
      movies.add(movie);
      emit(AddMovieSuccessed());
    } catch (e) {
      emit(AddMoviesFauilre(error: e.toString()));
    }
  }

  RemoveProducts(Movies movie) async {
    movies.remove(movie);
    emit(RemoveMoviesSuceessed(movies.toList()));
  }
}
