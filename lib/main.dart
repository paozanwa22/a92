import 'package:a92/pages/home.dart';
import 'package:a92/controllers/authC.dart';
import 'package:a92/controllers/loginC.dart';
import 'package:a92/pages/login.dart';
import 'package:a92/routes/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final loginC = Get.put(LoginC());
  final authC = Get.put(AuthC());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: authC.isAuth.isTrue ? const HomePage() : LoginPage(),
        getPages: AppPage.pages,
      ),
    );
  }
}
