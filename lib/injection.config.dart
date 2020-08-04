// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/get_it_helper.dart';

import 'features/movies/domain/usecases/get_popular_movies.dart';
import 'features/movies/presentation/bloc/movies_bloc.dart';
import 'features/movies/data/datasources/movies_remote_data_source.dart';
import 'features/movies/domain/repositories/movies_repository.dart';
import 'features/movies/data/repositories/movies_repository_impl.dart';
import 'core/network/network_info.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

void $initGetIt(GetIt g, {String environment}) {
  final gh = GetItHelper(g, environment);
  gh.lazySingleton<MoviesRemoteDataSource>(
      () => MoviesRemoteDataSourceImpl(client: g<Client>()));
  gh.lazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(g<DataConnectionChecker>()));
  gh.lazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(
      remoteDataSource: g<MoviesRemoteDataSource>(),
      networkInfo: g<NetworkInfo>()));
  gh.lazySingleton<GetPopularMovies>(
      () => GetPopularMovies(g<MoviesRepository>()));
  gh.factory<MoviesBloc>(
      () => MoviesBloc(getPopularMovies: g<GetPopularMovies>()));
}
