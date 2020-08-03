import 'movie_model.dart';
import '../../domain/entities/movie_page_response.dart';
import 'package:meta/meta.dart';

class MoviePageResponseModel extends MoviePageResponse {
  MoviePageResponseModel({
    @required int page,
    @required int totalResults,
    @required int totalPages,
    @required List<MovieModel> results,
  }) : super(
          page: page,
          totalResults: totalResults,
          totalPages: totalPages,
          results: results,
        );

  factory MoviePageResponseModel.fromJson(Map<String, dynamic> json) =>
      MoviePageResponseModel(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromJson(x))),
      );
}
