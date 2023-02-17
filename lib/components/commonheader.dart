import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sati/components/button.dart';
import 'package:sati/components/filterheader.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';

class CommonHeader extends StatefulWidget {
  final String? title;
  const CommonHeader({super.key, this.title = "Granites"});

  @override
  State<CommonHeader> createState() => _CommonHeaderState();
}

class _CommonHeaderState extends State<CommonHeader> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return gold;
      }
      return gold;
    }

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
                widget.title!,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed("/recent");
                },
                child: SvgPicture.asset(
                  'assets/svg/search.svg',
                  height: 21,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Scaffold(
                      backgroundColor: Color(0xffF8F6F0),
                      body: SafeArea(
                        child: Container(
                          height: height,
                          width: width,
                          child: Column(
                            children: [
                              FilterHeader(
                                title: "Filter",
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 17,
                                              horizontal: width * .05,
                                            ),
                                            child: Text(
                                              "Color",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 17,
                                              horizontal: width * .05,
                                            ),
                                            child: Text(
                                              "Quantity",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 17,
                                              horizontal: width * .05,
                                            ),
                                            child: Text(
                                              "Price",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 17,
                                              horizontal: width * .05,
                                            ),
                                            child: Text(
                                              "Offers",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 17,
                                              horizontal: width * .05,
                                            ),
                                            child: Text(
                                              "Thickness",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            color: gold,
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 17,
                                              horizontal: width * .05,
                                            ),
                                            child: Text(
                                              "Stock",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  fillColor:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                              getColor),
                                                  value: true,
                                                  onChanged: (bool? value) {},
                                                ),
                                                Text(
                                                  "Blocks",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  fillColor:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                              getColor),
                                                  value: false,
                                                  onChanged: (bool? value) {},
                                                ),
                                                Text(
                                                  "Gangsaw",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: 70,
                                padding: EdgeInsets.symmetric(
                                  vertical: 11,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: width * .4,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: width * .12,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: gold,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text("Clear all"),
                                      ),
                                    ),
                                    Container(
                                      width: width * .4,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: gold,
                                      ),
                                      child: Center(
                                        child: Text("Apply"),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  'assets/svg/filter.svg',
                  height: 18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
