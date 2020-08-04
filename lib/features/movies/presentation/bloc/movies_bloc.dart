import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_popular_movies.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  // Import the use cases to use
  final GetPopularMovies getPopularMovies;

  MoviesBloc({@required this.getPopularMovies}) : super(Empty());

  MoviesState get initialState => Empty();

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is GetPopularMovies) {
      yield Loading();
      final failureOrSuccess = await getPopularMovies(NoParams());
      yield failureOrSuccess.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (moviePageResponse) => Loaded(moviePageResponse: moviePageResponse),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    // Check the different possible failures
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case RequestFailure:
        return (failure as RequestFailure).message;
      default:
        return 'Unexpected Error';
    }
  }
}
