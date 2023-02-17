import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sati/constants/constants.dart';

class ApiService extends GetConnect implements GetxService {
  final box = GetStorage();
  // post method
  postmethod(data, url) async {
    try {
      var token = await box.read("token");
      Response response = await post(
        "$server$url",
        data,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token', //carrier
          'token': token
        },
      );
      if (response.statusCode == 200) {
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
      Fluttertoast.showToast(
        msg: "Something went wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return null;
    }
  }

  // get method
  getmethod(url) async {
    try {
      var token = await box.read('token');
      Response response = await get(
        "$server$url",
        headers: {
          'Content-Type': 'application/json; charset=UTF-8', //carrier
          'Authorization': 'Bearer $token', //carrier
          'token': token
        },
      );
      if (response.statusCode == 200) {
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
      print(e.toString());
    }
  }
}
