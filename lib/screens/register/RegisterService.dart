import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sati/constants/constants.dart';

class RegisterService extends GetConnect implements GetxService {
  // function to register data
  register(dynamic body) async {
    try {
      Response response = await post(
        "${server}register",
        body,
      );
      if (response.statusCode == 200) {
        print(response.body.toString());
        print("-----------");
        return response.body;
      } else {
        print(response.body.toString());
        Fluttertoast.showToast(
          msg: response.body["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return null;
      }
    } catch (e) {
      print(e.toString() + "error ocuures");
      return null;
    }
  }
}
