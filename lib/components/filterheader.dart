import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';

class FilterHeader extends StatefulWidget {
  final String title;
  final String? clear;
  const FilterHeader({super.key, required this.title, this.clear});

  @override
  State<FilterHeader> createState() => _FilterHeaderState();
}

class _FilterHeaderState extends State<FilterHeader> {
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
              Text(
                widget.title != null ? widget.title! : "",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
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
