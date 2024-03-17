import 'dart:convert';

import 'package:api_retrofit_project/core/constant/project_apis.dart';
import 'package:api_retrofit_project/core/shared_preference_helper.dart';
import 'package:dio/dio.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token;
    if (options.path == ProjectAPIs.profile) {
      final body = options.data;
      Map<String, dynamic> jsonMap = json.decode(body);
      String authToken = jsonMap['token'];

      if (authToken.isNotEmpty) {
        token = authToken;
      } else {
        token = await SharedPreferenceHelper.getToken();
      }
    }else{
      token = await  SharedPreferenceHelper.getToken();
    }
    if(token != null && token.isNotEmpty){
      options.headers ={
        'Authorization': 'Bearer $token'
      };
    }
    super.onRequest(options, handler);
  }
}
