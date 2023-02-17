import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sati/screens/history/history_modal.dart';
import 'package:sati/services/apiservice.dart';

class HistoryControler extends GetxController {
  bool loading = true;
  List<History> items = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    gethistory();
  }

  // objects
  ApiService api = ApiService();

  // get history
  gethistory() async {
    try {
      loading = true;
      update();
      var data = {};
      var res = await api.postmethod(data, "booking_history");
      print(res.toString());
      print("--------got history");
      items = historyFromJson(jsonEncode(res["data"]));
    } catch (e) {
      print(e.toString());
    }
    loading = false;
    update();
  }

  //book a product
  book(id, qty) async {
    loading = true;
    update();
    try {
      var data = {"productid": id, "quantity": qty};
      var res = await api.postmethod(data, "book_product");
      if (res != null) {
        Fluttertoast.showToast(
          msg: res["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.back();
      }
    } catch (e) {
      print(e.toString());
    }
    loading = false;
    update();
  }

  // book
  Future<bool> booking(id, qty) async {
    print("got id ----$id");
    bool status = false;
    loading = true;
    update();
    try {
      var data = {"productid": int.parse(id), "quantity": qty};
      var res = await api.postmethod(data, "book_product");
      if (res != null) {
        Fluttertoast.showToast(
          msg: res["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print(e.toString());
    }
    loading = false;
    update();
    return status;
  }
}
