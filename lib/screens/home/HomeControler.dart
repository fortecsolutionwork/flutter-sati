import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sati/screens/category/category_modal.dart';
import 'package:sati/services/apiservice.dart';

class HomeControler extends GetxController {
  final box = GetStorage();
  ApiService api = ApiService();
  var loading = true.obs;
  List<Category> items = [];
  List<Category> subs = [];
  String name = "Unknown";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getcategory();
    getname();
  }

  // function to get name
  getname() async {
    name = await box.read("name");
    update();
  }

  // function to get all categories
  getcategory() async {
    try {
      var res = await api.getmethod("category_list");
      var data = await api.getmethod("subcategory_list_by_id/1");
      items = categoryFromJson(jsonEncode(res["data"]));
      subs = categoryFromJson(jsonEncode(data["data"]["data"]));
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}
