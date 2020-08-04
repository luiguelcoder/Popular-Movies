import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:popular_movies/features/movies/data/models/movie_page_response_model.dart';
import 'package:popular_movies/features/movies/domain/entities/movie_page_response.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tMoviePageResponse = MoviePageResponseModel.fromJson(
    {
      "page": 1,
      "total_results": 10000,
      "total_pages": 500,
      "results": [
        {
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
        }
      ]
    },
  );

  test("Should be a SubClass of Movie Page Response Entity", () async {
    expect(tMoviePageResponse, isA<MoviePageResponse>());
  });

  group('fromJson', () {
    test(
      'Should return a valid model when the JSON Movie Page Res has one movie',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(await fixture('movie_page_response.json'));
        // act
        final result = MoviePageResponseModel.fromJson(jsonMap);
        // assert
        expect(result, tMoviePageResponse);
      },
    );
  });
}
