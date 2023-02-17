import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sati/screens/login/LoginService.dart';

class LoginControler extends GetxController {
  LoginService log = LoginService();
  final box = GetStorage();
  // parameters
  var isloading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController passcontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();

  void login() async {
    isloading = true;
    update();
    var data = {"email": emailcontroler.text, "password": passcontroler.text};
    // var data = {"email": "sumishappp11@gmail.com", "password": "123456"};
    try {
      var res = await log.loginapi(data);
      if (res != null) {
        box.write('token', res["data"]["token"]);
        box.write("name", res["data"]["name"]);
        Get.toNamed(
          "/otp",
          arguments: [
            "OTP verification",
            res["data"]["mobile"],
            res["data"]["otp_session_id"],
            true,
          ],
        );
      }
    } catch (e) {
      print(e.toString());
    }
    isloading = false;
    update();
  }
}
