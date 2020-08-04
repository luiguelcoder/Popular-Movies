import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String idMovie;
  final String posterPath;
  final Function callback;
  final bool isDetail;

  MoviePoster({
    @required this.idMovie,
    @required this.posterPath,
    @required this.callback,
    this.isDetail = false,
  });

  MoviePoster.detail({
    @required this.idMovie,
    @required this.posterPath,
    this.callback,
    this.isDetail = true,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "HM$idMovie",
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GestureDetector(
          onTap: !isDetail ? callback : null,
          child: FadeInImage(
            placeholder: AssetImage('assets/camera.jpg'),
            image: NetworkImage(
              posterPath,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
