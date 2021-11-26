// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginC extends GetxController {
  var hidden = true.obs;
  late TextEditingController emailC;
  late TextEditingController passC;

  @override
  void onInit() async {
    super.onInit();
    emailC = TextEditingController();
    passC = TextEditingController();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }


}