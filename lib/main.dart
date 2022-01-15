import 'package:beer_not_bear_flutter/controller/auth_controller.dart';
import 'package:beer_not_bear_flutter/pages/loading_page.dart';
import 'package:beer_not_bear_flutter/pages/login_register.dart';
import 'package:beer_not_bear_flutter/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();

  Get.put<AuthController>(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: const LoadingPage(),
      theme: appTheme,
    );
  }
}
