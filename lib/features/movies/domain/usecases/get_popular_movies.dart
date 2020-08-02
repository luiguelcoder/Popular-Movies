import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie_page_response.dart';
import '../repositories/movies_repository.dart';

class GetPopularMovies extends UseCase<MoviePageResponse, NoParams>{
  final MoviesRepository repository;

  GetPopularMovies(this.repository);

  Future<Either<Failure, MoviePageResponse>> call(NoParams params) async {
    return await repository.getPopularMovies();
  }
}