import 'package:app_test_api/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppTestApi());

class AppTestApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Test Api',
      home: HomePage(),
    );
  }
}
