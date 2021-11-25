// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthC extends GetxController {
  var isAuth = false.obs;

  final Map<String, String> _dataUser = {
    'email': 'admin@gmail.com',
    'password': 'admin',
  };

  void dialogError(String msg) {
    Get.defaultDialog(
      title: 'Terjadi Kesalahan',
      middleText: msg,
    );
  }

  void login(String email, String pass, bool rememberme) async {
    if (email != '' && pass != '') {
      if (GetUtils.isEmail(email)) {
        if (email == _dataUser['email'] && pass == _dataUser['password']) {
          if (rememberme) {
            // simpan di storage menggunakan get storage
            final box = GetStorage();
            box.write('dataUser', {
              'email': email,
              'password': pass,
              'rememberme': rememberme,
            });
          } else {
            // hapus storage
            final box = GetStorage();
            if (box.read('dataUser') != null) {
              box.erase();
            }
          }

          // berhasil login
          isAuth.value = true;
        } else {
          dialogError('user atau password salah');
        }
      } else {
        dialogError('Email tidak valid');
      }      
    } else {
      dialogError('Semua data input harus diisi.');
    }
  }
}