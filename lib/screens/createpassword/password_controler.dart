import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sati/services/apiservice.dart';

class PasswordControler extends GetxController {
  ApiService api = ApiService();
  final box = GetStorage();
  // parameters
  var isloading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController passcontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();

  // change password submit
  submit() async {
    try {
      isloading = true;
      update();
      var token = await box.read("token");
      var data = {
        "password": passcontroler.text,
        "c_password": emailcontroler.text,
        "token": token,
      };
      var res = await api.postmethod(data, "update_password");
      if (res != null) Get.offAllNamed("/login");
    } catch (e) {
      print(e.toString());
    }
    isloading = false;
    update();
  }
}
