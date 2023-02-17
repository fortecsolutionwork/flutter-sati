import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sati/constants/colors.dart';

class BottomTabs extends StatefulWidget {
  final int active;
  final Function(int) onPress;
  const BottomTabs({super.key, required this.onPress, required this.active});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      color: black,
      height: 60 + MediaQuery.of(context).padding.bottom,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                widget.onPress(0);
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 2,
                      color: widget.active == 0 ? gold : Colors.transparent,
                      width: 30,
                    ),
                    SvgPicture.asset(
                      "assets/svg/home.svg",
                      color: widget.active == 0 ? gold : Colors.white,
                    ),
                    Center(
                      child: Text(
                        "Home",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: widget.active == 0 ? gold : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                widget.onPress(1);
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 2,
                      color: widget.active == 1 ? gold : Colors.transparent,
                      width: 30,
                    ),
                    SvgPicture.asset(
                      "assets/svg/chat.svg",
                      color: widget.active == 1 ? gold : Colors.white,
                    ),
                    Center(
                      child: Text(
                        "Inbox",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: widget.active == 1 ? gold : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                widget.onPress(2);
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 2,
                      color: widget.active == 2 ? gold : Colors.transparent,
                      width: 30,
                    ),
                    SvgPicture.asset(
                      "assets/svg/wishlist.svg",
                      color: widget.active == 2 ? gold : Colors.white,
                    ),
                    Center(
                      child: Text(
                        "Wishlist",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: widget.active == 2 ? gold : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                widget.onPress(3);
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 2,
                      color: widget.active == 3 ? gold : Colors.transparent,
                      width: 30,
                    ),
                    SvgPicture.asset(
                      "assets/svg/cart.svg",
                      color: widget.active == 3 ? gold : Colors.white,
                    ),
                    Center(
                      child: Text(
                        "Cart",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: widget.active == 3 ? gold : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
