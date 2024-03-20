import 'package:api_retrofit_project/core/app_config.dart';
import 'package:api_retrofit_project/core/util/logger.dart';
import 'package:api_retrofit_project/core/webservice/api_client.dart';
import 'package:api_retrofit_project/view/my_app/my_app_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initApp();
}

void _initApp() async {
  loggerConfigure();
  await di.init();

  bool isAppConfigure = await AppConfig.configure();

  if (isAppConfigure) {
    ApiClient.initService();
    runApp(const MainApp());
  } else {
    runApp(_defaultApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyAppPage();
  }
}

Widget _defaultApp() => MaterialApp(
      home: Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            "No able to find app, Please restart the app",
            style: TextStyle(
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
