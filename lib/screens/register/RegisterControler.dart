import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sati/screens/register/RegisterService.dart';

class RegisterControler extends GetxController {
  RegisterService service = RegisterService();
  final box = GetStorage();
  // parameters
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController namecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController mobilecontroler = TextEditingController();
  TextEditingController countrycode = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    countrycode.text = "91";
  }

  // function to update country code
  countrycodeupdate(String val) {
    countrycode.text = val;
    update();
  }

  // function to send data to api
  void submit() async {
    loading = true;
    update();
    var data = {
      "email": emailcontroler.text,
      "mobile": "+" + countrycode.text + mobilecontroler.text,
      "name": namecontroler.text
    };
    var res = await service.register(data);
    if (res != null) {
      box.write('token', res["data"]["token"]);
      box.write('name', res["data"]["name"]);
      Get.toNamed(
        "/otp",
        arguments: [
          "Mobile verification",
          res["data"]["mobile"],
          res["data"]["otp_session_id"],
          false,
        ],
      );
    }
    loading = false;
    update();
  }
}
