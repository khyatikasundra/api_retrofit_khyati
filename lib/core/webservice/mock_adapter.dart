import 'dart:typed_data';

import 'package:api_retrofit_project/core/constant/project_apis.dart';
import 'package:api_retrofit_project/core/util/utilities.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class MockAdapter extends IOHttpClientAdapter {
  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    String url = options.uri.path;
    print(url);
    if (url == ProjectAPIs.profile) {
      print("mock");
      return await _convertToResponseBody(ProjectAPIs.mock.kProfile);
    }
    return super.fetch(options, requestStream, cancelFuture);
  }

  Future<ResponseBody> _convertToResponseBody(String? assetUrl) async {
    var headers = {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    };
    String responseStr = '';
    if (assetUrl != null) {
      responseStr = await Utilities.parseStringFromAssets(assetUrl);
      print(responseStr);
    }
    await Future.delayed(Duration(seconds: 3));
    return ResponseBody.fromString(responseStr, 200, headers: headers);
  }
}
