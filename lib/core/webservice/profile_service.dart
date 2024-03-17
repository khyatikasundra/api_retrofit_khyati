import 'package:api_retrofit_project/core/constant/project_apis.dart';
import 'package:api_retrofit_project/model/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @GET(ProjectAPIs.profile)
  Future<HttpResponse<ProfileModel>> fetchProfileDetail();
}
