import 'package:get/get.dart';
import 'package:sati/screens/single/Product_modal.dart';
import 'package:sati/screens/wishlist/wishlist_controler.dart';

class SingleControler extends GetxController {
  bool exist = false;
  WishlistControler wish = Get.find();
  bool loading = false;
  String id = "";
  late Product item;

  // add to whish list

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  //set item
  setitem(items) {
    item = items;
    update();
  }

  // check
  bool check(ids) {
    id = ids;
    exist = wish.checkitem(ids);
    update();
    return exist;
  }

  // add to wishlist
  additem(Product item) {
    exist = !exist;
    wish.additem(item);
    update();
  }

  // book product
  book(ids) async {
    print("found id $id");
    loading = true;
    update();
  }
}
