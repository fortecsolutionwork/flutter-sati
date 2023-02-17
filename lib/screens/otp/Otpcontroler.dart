import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sati/services/apiservice.dart';

class OtpControler extends GetxController {
  ApiService api = ApiService();
  final box = GetStorage();
  // parameters
  String otp = "";
  var loading = false;

  void submit(String value, String session, bool fromlogin) async {
    loading = true;
    update();
    try {
      var data = {"otp": value, "otp_session_id": session};
      var res = await api.postmethod(data, "verify_otp");
      if (fromlogin) {
        if (res != null) {
          await box.write("logedin", "yes");
          Get.offAllNamed("/home");
        }
      } else {
        if (res != null) Get.toNamed("/password");
      }
    } catch (e) {
      print(e.toString());
    }
    loading = false;
    update();
  }
}
