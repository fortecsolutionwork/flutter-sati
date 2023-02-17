import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sati/screens/category/category_modal.dart';
import 'package:sati/services/apiservice.dart';

class CategoryControler extends GetxController {
  ApiService api = ApiService();
  ScrollController scrollController = ScrollController();

  // properties
  List<Category> items = [];
  var loading = true;
  var id = "";
  int page = 0;
  int total = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        print("max position reached");
        getcatmore();
        // if (!loading) {
        //   loading = !loading;
        //   getmoresub();
        //   // Perform event when user reach at the end of list (e.g. do Api call)
        // }
      }
    });
  }

  // function to get all category
  getcategory() async {
    try {
      var res = await api.getmethod("category_list");
      items = categoryFromJson(jsonEncode(res["data"]));
    } catch (e) {
      print(e.toString());
    }
    loading = false;
    update();
  }

  // get category by id
  getcatbyid(dynamic ids) async {
    try {
      loading = true;
      id = ids.toString();
      update();
      var res = await api.getmethod("subcategory_list_by_id/$ids?page=$page");
      print(res.toString());
      print("------------result");
      items = categoryFromJson(jsonEncode(res["data"]["data"]));
      total = res["data"]["total"];
      page = page + 1;
    } catch (e) {
      print(e.toString());
    }

    loading = false;
    update();
  }

  // get more category
  getcatmore() async {
    if (loading || total == items.length) return;
    try {
      loading = true;
      update();
      var res = await api.getmethod("subcategory_list_by_id/$id?page=$page");
      // print(res["data"].toString());
      items.addAll(categoryFromJson(jsonEncode(res["data"]["data"])));
      page = page + 1;
    } catch (e) {
      print(e.toString());
    }
    loading = false;
    update();
  }
}
