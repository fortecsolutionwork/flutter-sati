import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sati/constants/constants.dart';

class LoginService extends GetConnect implements GetxService {
  // login api call
  loginapi(var data) async {
    try {
      Response response = await post(
        "${server}login",
        data,
      );
      if (response.statusCode == 200) {
        print(response.body.toString());
        return response.body;
      } else {
        print(response.body.toString());
        print(response.statusCode);
        print(response.statusText);
        // Fluttertoast.showToast(
        //   msg: response.body["message"],
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: Colors.red,
        //   textColor: Colors.white,
        //   fontSize: 16.0,
        // );
        return null;
      }
    } catch (e) {
      print(e.toString() + "error ocuures");
      return null;
    }
  }
}
