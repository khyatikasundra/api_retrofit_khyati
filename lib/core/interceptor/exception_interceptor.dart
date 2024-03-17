import 'package:api_retrofit_project/core/constant/strings.dart';
import 'package:api_retrofit_project/core/error/exception.dart';
import 'package:api_retrofit_project/core/error/failure_response.dart';
import 'package:dio/dio.dart';

class ExceptionInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.badResponse:
        handleResponse(err);
        break;
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      print(err.response?.statusCode);
        throw ServerException(
            exceptionMessage: Strings.errorMessage.noInternetConnection,
            authenticationStatusCode: err.response?.statusCode);
      case DioExceptionType.unknown:
      break;
    }
    super.onError(err, handler);
  }

  void handleResponse(DioException err) {
    var response = err.response;
    switch (response?.statusCode) {
      case 400:
        final FailureResponse exception =
            FailureResponse.fromJson(response?.data);

        throw BadRequestException(
            exceptionMessage: exception.message,
            authenticationStatusCode: response?.statusCode);
    }
  }
}
