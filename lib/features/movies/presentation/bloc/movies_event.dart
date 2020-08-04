import 'package:meta/meta.dart';

@immutable
abstract class MoviesEvent {}

class LoadPopularMovies extends MoviesEvent {}
