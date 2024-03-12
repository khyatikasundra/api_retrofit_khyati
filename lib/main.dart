import 'package:api_retrofit_project/core/webservice/api_client.dart';
import 'package:api_retrofit_project/view/home/screen/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  _initApp();
  runApp(const MainApp());
}

void _initApp() async {
  ApiClient.initService();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
