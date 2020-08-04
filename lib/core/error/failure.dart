import 'package:meta/meta.dart';

abstract class Failure {}

class ServerFailure extends Failure {}

class RequestFailure extends Failure {
  final String message;

  RequestFailure({@required this.message});
}

class ConnectionFailure extends Failure {}
