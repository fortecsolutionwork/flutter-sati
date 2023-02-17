import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/home/HomeControler.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
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
              Icon(
                Icons.menu,
                color: gold,
                size: 27,
              ),
              const SizedBox(
                width: 20,
              ),
              GetBuilder<HomeControler>(
                init: HomeControler(),
                initState: (_) {},
                builder: (_) {
                  return Text(
                    _.name != null ? _.name : "",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  );
                },
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
                  height: 20,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                'assets/svg/notification.svg',
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
