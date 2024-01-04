import 'package:movies_app/models/movies.dart';

class MoviesStates {}

class AddMovieIntial extends MoviesStates {}

class AddMovieSuccessed extends MoviesStates {}

class AddMoviesFauilre extends MoviesStates {
  final String error;

  AddMoviesFauilre({required this.error});
}

class RemoveMoviesSuceessed extends MoviesStates {
  final List<Movies> updateMovies;

  RemoveMoviesSuceessed(this.updateMovies);
}

class RemoveProductfauilre extends MoviesStates {
  final String errorMessage;
  RemoveProductfauilre(this.errorMessage);
}
