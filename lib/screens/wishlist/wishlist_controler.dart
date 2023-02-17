import 'dart:convert';

import 'package:get/get.dart';
import 'package:sati/screens/single/Product_modal.dart';
import 'package:sati/services/apiservice.dart';

class WishlistControler extends GetxController {
  ApiService api = ApiService();
  var loading = false;
  List<Product> items = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getwishlistitem();
  }

  // get all wishlist items
  getwishlistitem() async {
    try {
      var res = await api.postmethod({}, "get_wishlist");
      if (res != null) {
        print("got result ---${res["data"].toString()}");
        items = productFromJson(jsonEncode(res["data"]));
        update();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // add to wishlist
  additem(Product item) async {
    var exist = false;
    for (int i = 0; i < items.length; i++) {
      if (items[i].id == item.id) {
        items.removeAt(i);
        exist = true;
      }
    }
    if (exist == false) {
      items.add(item);
    }
    update();
    try {
      var data = {"productid": item.id};
      var res = await api.postmethod(data, "add_to_wishlist");
    } catch (e) {
      print(e.toString());
    }
  }

  // check wishlist
  bool checkitem(dynamic id) {
    bool exist = false;
    for (int i = 0; i < items.length; i++) {
      if (items[i].id.toString() == id.toString()) {
        exist = true;
      }
    }
    return exist;
  }
}
