import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'movie.dart';

class MoviePageResponse extends Equatable {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<Movie> results;

  MoviePageResponse({
    @required this.page,
    @required this.totalResults,
    @required this.totalPages,
    @required this.results,
  });

  @override
  List<Object> get props => [page, totalResults, totalPages, results];
}
