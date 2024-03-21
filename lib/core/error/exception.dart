import 'package:dio/dio.dart';

class Failure extends DioException {
  final String? errorMessage;
  final int? statusCode;
  Failure({required this.errorMessage, this.statusCode})
      : super(requestOptions: RequestOptions(path: ''));
  @override
  String get message => errorMessage ?? '';
}

class BadRequestException extends Failure {
  final String exceptionMessage;
  final int? authenticationStatusCode;
  BadRequestException(
      {required this.exceptionMessage, required this.authenticationStatusCode})
      : super(
            errorMessage: exceptionMessage,
            statusCode: authenticationStatusCode);
}

class ServerException extends Failure {
  final String? exceptionMessage;
  final int? authenticationStatusCode;
  ServerException(
      {required this.exceptionMessage, this.authenticationStatusCode})
      : super(
            errorMessage: exceptionMessage,
            statusCode: authenticationStatusCode);
}

class UnAuthorizedException extends Failure {
  final String exceptionMessage;
  final int? authenticationStatusCode;
  UnAuthorizedException(
      {required this.exceptionMessage, required this.authenticationStatusCode})
      : super(
            errorMessage: exceptionMessage,
            statusCode: authenticationStatusCode);
}

class FetchDataException extends Failure {
  final String exceptionMessage;
  FetchDataException({required this.exceptionMessage})
      : super(errorMessage: exceptionMessage);
}
