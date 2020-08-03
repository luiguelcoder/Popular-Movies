import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:popular_movies/core/error/exception.dart';
import 'package:popular_movies/features/movies/data/datasources/movies_remote_data_source.dart';
import 'package:popular_movies/features/movies/data/models/movie_model.dart';
import 'package:popular_movies/features/movies/data/models/movie_page_response_model.dart';
import 'package:matcher/matcher.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MoviesRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  const _key = "334e246dda43cdc25df8a6c442e4fb21";
  const _url = "https://api.themoviedb.org";
  const _urlGetPopularMovies = "$_url/3/movie/popular?api_key=$_key";

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = MoviesRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(
            argThat(
              startsWith(_urlGetPopularMovies),
            ),
            headers: anyNamed('headers')))
        .thenAnswer(
      (_) async => http.Response(
        await fixture('movie_page_response.json'),
        200,
      ),
    );
  }

  void setUpMockHttpClientFailure401() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(
        await fixture('movie_page_response_401.json'),
        401,
      ),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(
        await fixture('movie_page_response_404.json'),
        404,
      ),
    );
  }

  group('getPopularMovies', () {
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
      "Should perform a GET request on the URL with application/json header",
      () async {
        //arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource.getPopularMovies();
        // assert
        verify(mockHttpClient.get(
          _urlGetPopularMovies,
          headers: {
            "Content-Type": "application/json; charset=utf-8",
          },
        ));
      },
    );

    test(
      'Should return MoviePageResponse when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getPopularMovies();
        // assert
        expect(result, equals(tMoviePageResponse));
      },
    );

    test(
      'should throw a RequestError when the response code is 401 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure401();
        // act
        final call = dataSource.getPopularMovies;
        // assert
        expect(() => call(), throwsA(TypeMatcher<RequestError>()));
      },
    );

    test(
      'should throw a RequestError when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getPopularMovies;
        // assert
        expect(() => call(), throwsA(TypeMatcher<RequestError>()));
      },
    );
  });
}
