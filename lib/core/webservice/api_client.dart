import 'package:api_retrofit_project/core/constant/profiles.dart';
import 'package:api_retrofit_project/core/interceptor/exception_interceptor.dart';
import 'package:api_retrofit_project/core/webservice/authenticate_service.dart';

import 'package:dio/dio.dart';

class ApiClient {
  static late AuthenticateService authenticateService;
  static void initService() {
    final dio = Dio()
      ..options = BaseOptions(
          baseUrl: Profiles.developProfiles.baseUrl,
          contentType: Headers.jsonContentType);
    dio.interceptors.add(ExceptionInterceptor());

    authenticateService = AuthenticateService(dio);
  }
}
