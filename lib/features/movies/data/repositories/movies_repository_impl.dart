import 'package:dartz/dartz.dart';
import 'package:popular_movies/core/error/exception.dart';
import 'package:popular_movies/core/network/network_info.dart';
import '../datasources/movies_remote_data_source.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/movie_page_response.dart';
import '../../domain/repositories/movies_repository.dart';
import 'package:meta/meta.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MoviesRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, MoviePageResponse>> getPopularMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final moviesPageResponse = await remoteDataSource.getPopularMovies();
        return Right(moviesPageResponse);
      } on RequestError catch (requestError) {
        return Left(RequestFailure(message: requestError.message));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
