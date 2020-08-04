import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../../domain/entities/movie.dart';
import '../movie_detail/movie_detail_page.dart';
import '../../widgets/movie_poster.dart';
import 'widgets/movie_information.dart';
import '../../bloc/movies_state.dart';
import '../../bloc/movies_event.dart';
import '../../bloc/movies_bloc.dart';

import '../../../../../injection.dart';

class MoviesOverviewPage extends StatelessWidget {
  final ValueNotifier<int> _currentMovie = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => getIt<MoviesBloc>()
          ..add(
            LoadPopularMovies(),
          ),
        child: BlocConsumer<MoviesBloc, MoviesState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is Empty) {
            } else {
              if (state is Loading) {
              } else {
                if (state is Loaded) {
                  return Column(
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        flex: 7,
                        child: Swiper(
                          outer: true,
                          itemBuilder: (BuildContext context, int index) {
                            return MoviePoster(
                              posterPath: state.moviePageResponse.results[index]
                                  .getPosterPath(),
                              callback: () {
                                _navigateToMovieDetail(
                                  context: context,
                                  movie: state.moviePageResponse.results[index],
                                );
                              },
                            );
                          },
                          itemCount: state.moviePageResponse.results.length,
                          viewportFraction: 0.75,
                          scale: 0.80,
                          loop: false,
                          pagination: null,
                          onIndexChanged: _changeIndex,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: ValueListenableBuilder<int>(
                            valueListenable: _currentMovie,
                            builder: (context, index, child) {
                              return MovieInformation(
                                movie: state.moviePageResponse.results[index],
                                callback: () {
                                  _navigateToMovieDetail(
                                    context: context,
                                    movie:
                                        state.moviePageResponse.results[index],
                                  );
                                },
                              );
                            }),
                      ),
                    ],
                  );
                }
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _changeIndex(int index) {
    _currentMovie.value = index;
  }

  void _navigateToMovieDetail({BuildContext context, Movie movie}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MovieDetailPage(
          movie: movie,
        ),
      ),
    );
  }
}