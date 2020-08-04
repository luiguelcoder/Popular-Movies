import 'package:flutter/material.dart';
import '../../widgets/movie_poster.dart';
import '../../../domain/entities/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 2,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                movie.title,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              background: FadeInImage(
                placeholder: AssetImage("assets/camera.jpg"),
                image: NetworkImage(movie.getBackdropPath()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: 120,
                        child: MoviePoster.detail(
                          idMovie: movie.id.toString(),
                          posterPath: movie.getPosterPath(),
                        ),
                      ),
                      SizedBox(width: 8),
                      _movieInformation(context: context, movie: movie),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _movieInformation({BuildContext context, Movie movie}) {
    return Flexible(
      child: Text(
        "${movie.title} (${movie.releaseDate.year.toString()})",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
