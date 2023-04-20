import 'package:flutter/material.dart';
import 'package:food_app_getx/src/pages/auth/controller/auth_controller.dart';
import 'package:food_app_getx/src/pages_routes/pages_routes.dart';
import 'package:get/get.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GreenGrocer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1).withAlpha(180),
      ),
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages
    );
  }
}

