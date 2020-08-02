import 'package:meta/meta.dart';

class ServerException implements Exception {}

class RequestError implements Exception {
  final String message;

  RequestError({@required this.message});
}
