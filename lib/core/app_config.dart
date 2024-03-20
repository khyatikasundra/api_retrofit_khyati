import 'package:api_retrofit_project/core/util/logger.dart';
import 'package:api_retrofit_project/core/constant/profiles.dart';
import 'package:api_retrofit_project/core/constant/strings.dart';
import 'package:api_retrofit_project/core/util/utilities.dart';
import 'package:flutter/services.dart';

enum Environment { dev, prod }

class AppConfig {
  final Environment flavor;
  final String apiBaseUrl;

  AppConfig({required this.flavor, required this.apiBaseUrl});

  static late AppConfig _instance;

  static Future<bool> configure() async {
    try {
      final String? flavor = await (MethodChannel(Strings.channel.kApp)
          .invokeMethod<String>(Strings.channelMethod.kFlavor));
      if (flavor != null) {
        print("Inside flavor");
        log.info(" started $flavor");
        _setupEnvironment(Utilities.enumFromString(flavor, Environment.values));
        print("after setup");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static void _setupEnvironment(Environment flavorName) {
    print("inside set up");
    late String baseUrl;
    late Environment flavor;
    switch (flavorName) {
      case Environment.dev:
        baseUrl = Profiles.developProfiles.baseUrl;
        flavor = flavorName;
        break;
      case Environment.prod:
        baseUrl = Profiles.productionProfiles.baseUrl;
        flavor = flavorName;
        break;
    }
    _instance = AppConfig(flavor: flavor, apiBaseUrl: baseUrl);
    log.info('APP CONFIGURED FOR: $flavorName');
  }

  static AppConfig getInstance() => _instance;
}
