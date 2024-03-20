import 'package:api_retrofit_project/core/constant/project_apis.dart';
import 'package:api_retrofit_project/core/interceptor/api_logger.dart';
import 'package:api_retrofit_project/core/shared_preference_helper.dart';
import 'package:dio/dio.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token;
    if (options.path == ProjectAPIs.profile) {
      token = await SharedPreferenceHelper.getToken();
      // print(token);
      // if ((token ?? '').isEmpty) {
      //   token =
      //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvSmVhbm5lLnBuZz9zZXQ9c2V0NCIsImlhdCI6MTcxMDY2NzUzNCwiZXhwIjoxNzEwNjcxMTM0fQ.auKKf-oFB8PHFI3APOyJmw9UPnQnDKQMXuyI3-zNz9s";
      // }
    } else {
      token = await SharedPreferenceHelper.getToken();
    }
    if (token != null && token.isNotEmpty) {
      options.headers = {'Authorization': 'Bearer $token'};
    }
    APiLogger.addRequestLog(options);
    super.onRequest(options, handler);
  }
}
