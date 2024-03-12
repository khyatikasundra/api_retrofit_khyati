import 'package:api_retrofit_project/constant/product_apis.dart';
import 'package:api_retrofit_project/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'product_list_service.g.dart';

@RestApi(baseUrl: '')
abstract class ProductListService {
  factory ProductListService(Dio dio, {String baseUrl}) = _ProductListService;

  @GET(ProductAPIs.productListing)
  Future<HttpResponse<ProductModel>> fetchProductListing();
}
