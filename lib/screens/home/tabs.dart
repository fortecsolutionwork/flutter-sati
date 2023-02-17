import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sati/screens/category/category_page.dart';
import 'package:sati/screens/chat/chat_page.dart';
import 'package:sati/screens/history/history_page.dart';
import 'package:sati/screens/home/HomeControler.dart';
import 'package:sati/screens/home/components/bottom_tabs.dart';
import 'package:sati/screens/home/home_page.dart';
import 'package:sati/screens/wishlist/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeControler home = Get.put(HomeControler());
  List<Widget> tabs = [HomeTab(), ChatPage(), WishListPage(), HistoryPage()];
  int active = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F6F0),
      body: SafeArea(child: tabs[active]),
      bottomNavigationBar: BottomTabs(
        active: active,
        onPress: (int selected) {
          setState(() {
            active = selected;
          });
        },
      ),
    );
  }
}
