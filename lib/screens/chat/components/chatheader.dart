import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';

class ChatHeader extends StatefulWidget {
  final String title;
  final String? clear;
  const ChatHeader({super.key, required this.title, this.clear});

  @override
  State<ChatHeader> createState() => _ChatHeaderState();
}

class _ChatHeaderState extends State<ChatHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * .05),
      height: 70,
      color: black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: gold,
                  size: 28,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/img/sati.png",
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.title != null ? widget.title : "",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            widget.clear != null ? widget.clear! : "",
            style: TextStyle(
              fontSize: 16,
              color: gold,
            ),
          )
        ],
      ),
    );
    ;
  }
}
