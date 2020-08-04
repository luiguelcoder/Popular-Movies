import 'package:meta/meta.dart';
import '../../domain/entities/movie_page_response.dart';

@immutable
abstract class MoviesState {}

class Empty extends MoviesState {}

class Loading extends MoviesState {}

class Loaded extends MoviesState {
  final MoviePageResponse moviePageResponse;

  Loaded({@required this.moviePageResponse});
}

class Error extends MoviesState {
  final String message;

  Error({@required this.message});
}

