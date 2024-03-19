import 'package:api_retrofit_project/core/constant/profiles.dart';
import 'package:api_retrofit_project/core/interceptor/exception_interceptor.dart';
import 'package:api_retrofit_project/core/interceptor/header_interceptor.dart';
import 'package:api_retrofit_project/core/webservice/authenticate_service.dart';
import 'package:api_retrofit_project/core/webservice/mock_adapter.dart';
import 'package:api_retrofit_project/core/webservice/profile_service.dart';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static late AuthenticateService authenticateService;
  static late ProfileService profileService;
  static void initService() {
    final dio = Dio()
      ..options = BaseOptions(
          baseUrl: Profiles.developProfiles.baseUrl,
          contentType: Headers.jsonContentType)
      ..httpClientAdapter = MockAdapter();
      
    dio.interceptors.addAll([
      ExceptionInterceptor(),
      HeaderInterceptor(),
      PrettyDioLogger()
    ]);

    authenticateService = AuthenticateService(dio);
    profileService = ProfileService(dio);
  }
}
