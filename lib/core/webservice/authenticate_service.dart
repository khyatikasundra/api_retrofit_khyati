import 'package:api_retrofit_project/core/constant/project_apis.dart';
import 'package:api_retrofit_project/model/login_request_model.dart';
import 'package:api_retrofit_project/model/login_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'authenticate_service.g.dart';

@RestApi()
abstract class AuthenticateService {
  factory AuthenticateService(Dio dio, {String baseUrl}) = _AuthenticateService;

  @POST(ProjectAPIs.authenticate)
  Future<HttpResponse<LoginResponseModel>> authenticateUser(
      @Body() LoginRequestModel request);
}
