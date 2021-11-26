import 'package:a92/controllers/authC.dart';
import 'package:a92/controllers/loginC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final c = Get.find<LoginC>();
  final auth = Get.find<AuthC>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN PAGE"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: c.emailC,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ), 
            const SizedBox(height: 10),
            Obx(
              () => TextField(
                controller: c.passC,
                autocorrect: false,
                obscureText: c.hidden.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => c.hidden.toggle(),
                    icon: c.hidden.isTrue
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined),
                  ),
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => auth.login(
                c.emailC.text,
                c.passC.text,
              ),
              child: const Text('LOGIN'),
            ),
          ],
        ),
      ),      
    );
  }
}
