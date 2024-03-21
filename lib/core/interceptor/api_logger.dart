import 'package:dio/dio.dart';
import 'package:api_retrofit_project/core/util/logger.dart';

class APiLogger {
  static void addRequestLog(RequestOptions options) {
    log.info('******* Request *********');
    printLog('URL: ', options.uri);
    printLog('method', options.method);
  }

  static void addResponseLog(Response response) {
    log.info('******* Response ********');
    printLog('uri', response.requestOptions.uri);
    printLog('statusCode', response.statusCode);
    printLog('body', response.data);
  }

  static void printLog(String key, dynamic value) {
    log.info('$key : $value');
  }
}
