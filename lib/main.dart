import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip/main_bindings.dart';
import 'package:tip/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      initialBinding: MainBinding(),
      getPages: AppRoutes.pages,
    );
  }
}
