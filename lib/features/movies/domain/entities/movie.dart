import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Movie extends Equatable {
  final double popularity;
  final int voteCount;
  final bool video;
  final String posterPath;
  final int id;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String title;
  final double voteAverage;
  final String overview;
  final DateTime releaseDate;

  Movie({
    @required this.popularity,
    @required this.voteCount,
    @required this.video,
    @required this.posterPath,
    @required this.id,
    @required this.adult,
    @required this.backdropPath,
    @required this.originalLanguage,
    @required this.originalTitle,
    @required this.genreIds,
    @required this.title,
    @required this.voteAverage,
    @required this.overview,
    @required this.releaseDate,
  });

  @override
  List<Object> get props => [
        popularity,
        voteCount,
        video,
        posterPath,
        id,
        adult,
        backdropPath,
        originalLanguage,
        originalTitle,
        genreIds,
        title,
        voteAverage,
        overview,
        releaseDate,
      ];
}
