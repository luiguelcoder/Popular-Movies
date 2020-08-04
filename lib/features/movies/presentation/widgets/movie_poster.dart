import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String posterPath;
  final Function callback;
  final bool isDetail;

  MoviePoster({
    @required this.posterPath,
    @required this.callback,
    this.isDetail = false,
  });

  MoviePoster.detail({
    @required this.posterPath,
    this.callback,
    this.isDetail = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        onTap: !isDetail ? callback : null,
        child: FadeInImage(
          placeholder: AssetImage('assets/camera.png'),
          image: NetworkImage(
            posterPath,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
