import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';

class HeaderSearch extends StatefulWidget {
  const HeaderSearch({super.key});

  @override
  State<HeaderSearch> createState() => _HeaderSearchState();
}

class _HeaderSearchState extends State<HeaderSearch> {
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          height: 70,
          width: width,
          color: black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Expanded(
                child: Container(
                  // color: Colors.white,
                  child: TextFormField(
                    onChanged: (String val) {
                      setState(() {
                        value = val;
                      });
                    },
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        //label: Text("Search items"),
                        border: InputBorder.none,
                        hintText: "Search for products",
                        hintStyle: TextStyle(
                          color: Color(0xff868686),
                          fontSize: 16,
                        ),
                        suffixIcon: Icon(
                          Icons.close,
                          color: gold,
                          size: 22,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        value != ""
            ? Container(
                color: Colors.white,
                child: Column(
                  children: items
                      .map(
                        (e) => Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: width * .05,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/search.svg",
                                color: Color(0xffABABAB),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  "assets/img/" +
                                      items[Random().nextInt(catitems.length)],
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Black Impala Granite",
                                style: TextStyle(
                                  color: heading,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
