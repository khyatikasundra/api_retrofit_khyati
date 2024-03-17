import 'package:api_retrofit_project/core/webservice/api_client.dart';
import 'package:api_retrofit_project/view/my_app/my_app_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _initApp();
    runApp(const MainApp());
}

void _initApp() async {
  await di.init();
  ApiClient.initService();

}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyAppPage();
  }
}
