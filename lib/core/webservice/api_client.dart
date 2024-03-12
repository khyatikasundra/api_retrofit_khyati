import 'package:api_retrofit_project/constant/profiles.dart';
import 'package:api_retrofit_project/core/webservice/product_list_service.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static late final ProductListService productListService;

  static void initService() {
    final dio = Dio()
      ..options = BaseOptions(baseUrl: Profiles.developProfiles.baseUrl);

    productListService = ProductListService(dio);
  }
}
