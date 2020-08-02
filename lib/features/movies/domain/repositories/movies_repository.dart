import 'package:dartz/dartz.dart';
import '../entities/movie_page_response.dart';
import '../../../../core/error/failure.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MoviePageResponse>> getPopularMovies();
}