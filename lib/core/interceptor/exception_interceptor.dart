import 'package:api_retrofit_project/core/constant/app_strings.dart';
import 'package:api_retrofit_project/core/error/exception.dart';
import 'package:api_retrofit_project/core/error/failure_response.dart';
import 'package:api_retrofit_project/core/interceptor/api_logger.dart';
import 'package:dio/dio.dart';

class ExceptionInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.badResponse:
        handleResponse(err);
        break;
      case DioExceptionType.connectionTimeout:
        throw ServerException(
            exceptionMessage: AppStrings.message.kRequestTimeout);
      case DioExceptionType.sendTimeout:
        throw ServerException(
            exceptionMessage: AppStrings.message.kSendTimeout);
      case DioExceptionType.receiveTimeout:
        throw ServerException(
            exceptionMessage: AppStrings.message.kNoInternetConnection);
      case DioExceptionType.cancel:
        throw ServerException(
            exceptionMessage: AppStrings.message.kRequestCancelled);
      case DioExceptionType.connectionError:
        throw ServerException(
            exceptionMessage: AppStrings.message.kNoInternetConnection,
            authenticationStatusCode: err.response?.statusCode);
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        throw ServerException(
            exceptionMessage: AppStrings.message.kSomethingWentWrong);
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
      case 401:
        final FailureResponse exception =
            FailureResponse.fromJson(response?.data);
        throw UnAuthorizedException(
            exceptionMessage: exception.message,
            authenticationStatusCode: response!.statusCode);
      case 404:
        final FailureResponse exception =
            FailureResponse.fromJson(response?.data);
        throw UnAuthorizedException(
            exceptionMessage: exception.message,
            authenticationStatusCode: response!.statusCode);
      case 500:
      default:
        final FailureResponse exception =
            FailureResponse.fromJson(response?.data);
        throw FetchDataException(exceptionMessage: exception.message);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    APiLogger.addResponseLog(response);
    super.onResponse(response, handler);
  }
}
