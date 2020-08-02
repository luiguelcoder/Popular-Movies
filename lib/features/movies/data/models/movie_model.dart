import '../../domain/entities/movie.dart';
import 'package:meta/meta.dart';

class MovieModel extends Movie {
  MovieModel({
    @required double popularity,
    @required int voteCount,
    @required bool video,
    @required String posterPath,
    @required int id,
    @required bool adult,
    @required String backdropPath,
    @required String originalLanguage,
    @required String originalTitle,
    @required List<int> genreIds,
    @required String title,
    @required double voteAverage,
    @required String overview,
    @required DateTime releaseDate,
  }) : super(
          popularity: popularity,
          voteCount: voteCount,
          video: video,
          posterPath: posterPath,
          id: id,
          adult: adult,
          backdropPath: backdropPath,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          genreIds: genreIds,
          title: title,
          voteAverage: voteAverage,
          overview: overview,
          releaseDate: releaseDate,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
      );
}
