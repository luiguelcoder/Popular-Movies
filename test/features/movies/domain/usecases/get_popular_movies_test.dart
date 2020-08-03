import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:popular_movies/core/usecases/usecase.dart';
import 'package:popular_movies/features/movies/data/models/movie_model.dart';
import 'package:popular_movies/features/movies/data/models/movie_page_response_model.dart';
import 'package:popular_movies/features/movies/domain/repositories/movies_repository.dart';
import 'package:popular_movies/features/movies/domain/usecases/get_popular_movies.dart';

/// This represents the mock for the MoviesRepository
class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  MockMoviesRepository mockMoviesRepository;
  GetPopularMovies usecase;

  setUp(() {
    mockMoviesRepository = MockMoviesRepository();
    usecase = GetPopularMovies(mockMoviesRepository);
  });

  final tMoviePageResponse = MoviePageResponseModel(
    page: 1,
    totalResults: 1000,
    totalPages: 500,
    results: [
      MovieModel.fromJson({
        "popularity": 241.4,
        "vote_count": 2572,
        "video": false,
        "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
        "id": 583083,
        "adult": false,
        "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
        "original_language": "en",
        "original_title": "The Kissing Booth 2",
        "genre_ids": [35, 10749],
        "title": "The Kissing Booth 2",
        "vote_average": 8.2,
        "overview": "With college decisions looming, Elle juggles her "
            "long-distance romance with Noah, changing relationship with "
            "bestie Lee and feelings for a new classmate.",
        "release_date": "2020-07-24"
      }),
    ],
  );

  test(
    "Should get a Movie Page Response from the repository",
    () async {
      // When GetPopularMovies is called, always answer with the Right "side"
      // of Either containing a test MoviesPageResponse object.
      when(mockMoviesRepository.getPopularMovies()).thenAnswer(
        (_) async => Right(tMoviePageResponse),
      );

      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(NoParams());

      // UseCase should return whatever was returned from the Repository
      // in this case the Right part with a MoviePageResponse
      expect(result, Right(tMoviePageResponse));

      // Verify that the method has been called on the Repository
      verify(mockMoviesRepository.getPopularMovies());

      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockMoviesRepository);
    },
  );
}
