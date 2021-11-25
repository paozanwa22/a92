import 'package:a92/pages/login.dart';
import 'package:a92/pages/home.dart';
import 'package:a92/routes/route_name.dart';
import 'package:get/get.dart';

class AppPage {
  static final pages = [
    GetPage(name: RouteName.home, page: () => const HomePage()),
    GetPage(name: RouteName.login, page: () => LoginPage()),
  ];
}