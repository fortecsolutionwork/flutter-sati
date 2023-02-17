import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sati/screens/single/Product_modal.dart';
import 'package:sati/screens/wishlist/wishlist_controler.dart';
import 'package:sati/services/apiservice.dart';

class SubControler extends GetxController {
  WishlistControler wish = Get.find();
  ScrollController scrollController = ScrollController();
  List<Product> items = [];
  var id = "";
  int page = 1;
  var loading = true;
  bool exist = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        print("max position reached");
        // if (!loading) {
        //   loading = !loading;
        //   getmoresub();
        //   // Perform event when user reach at the end of list (e.g. do Api call)
        // }
      }
    });
  }

  // controlers
  ApiService api = ApiService();

  // function to get sub category
  getsubcategory(ids) async {
    print("id is --------$id");
    try {
      var res =
          await api.getmethod("product_list_by_subcategory/$ids?page=$page");
      if (res != null) {
        print(res.toString());
        print("all products -----");
        items = productFromJson(jsonEncode(res["data"]["products"]));
        page = page + 1;
        id = ids;
      }
      loading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  // get more items
  getmoresub() async {
    loading = true;
    update();
    try {
      var res =
          await api.getmethod("product_list_by_subcategory/$id?page=$page");
      items.addAll(productFromJson(jsonEncode(res["data"])));
      page = page + 1;
      loading = false;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  // add to wishlist
  additem(Product item) {
    wish.additem(item);
    update();
  }
}
