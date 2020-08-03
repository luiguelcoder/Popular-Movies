import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:popular_movies/core/error/exception.dart';

import '../models/movie_page_response_model.dart';
import 'package:http/http.dart' as http;

abstract class MoviesRemoteDataSource {
  Future<MoviePageResponseModel> getPopularMovies();
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  static const String _key = "334e246dda43cdc25df8a6c442e4fb21";
  static const String _url = "https://api.themoviedb.org";
  static const String _urlGetPopularMovies =
      "$_url/3/movie/popular?api_key=$_key";

  final http.Client client;

  MoviesRemoteDataSourceImpl({@required this.client});

  @override
  Future<MoviePageResponseModel> getPopularMovies() async {
    final response = await client.get(
      _urlGetPopularMovies,
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
    );
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      return MoviePageResponseModel.fromJson(data);
    } else {
      if (response.statusCode == 401 || response.statusCode == 404) {
        throw RequestError(message: data["status_message"]);
      } else {
        throw ServerException();
      }
    }
  }
}
