import 'movie.dart';

class MoviePageResponse {
  int page;
  int totalResults;
  int totalPages;
  List<Movie> results;

  MoviePageResponse({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });
}
