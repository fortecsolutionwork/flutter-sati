import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/category/category_modal.dart';
import 'package:sati/screens/history/history_controler.dart';
import 'package:sati/screens/home/HomeControler.dart';
import 'package:sati/screens/home/components/header.dart';
import 'package:sati/screens/wishlist/wishlist_controler.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  CarouselController buttonCarouselController = CarouselController();
  WishlistControler wish = Get.put(WishlistControler());
  HistoryControler hish = Get.put(HistoryControler());

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Header(),
          CarouselSlider(
            options: CarouselOptions(
                height: 220,
                viewportFraction: 1,
                onPageChanged: ((index, reason) {
                  setState(() {
                    current = index;
                  });
                })),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                          black.withOpacity(.5),
                          BlendMode.darken,
                        ),
                        image: AssetImage(
                          "assets/img/carousel.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/img/logocolor.png",
                          height: 50,
                          width: width * .2,
                          fit: BoxFit.contain,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: width * .49,
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: gold.withOpacity(.9),
                            ),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. estibulum eget lorem at magna",
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0, 1, 2, 3, 4].map((e) {
                return Container(
                  margin: EdgeInsets.only(
                    right: 5,
                    top: 10,
                  ),
                  width: current == e ? 22 : 14,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: current == e
                        ? Colors.black
                        : Color(0xff0A0802).withOpacity(.25),
                  ),
                );
              }).toList(),
            ),
          ),
          GetBuilder<HomeControler>(
            init: HomeControler(),
            initState: (_) {},
            builder: (_) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * .05,
                  vertical: 20,
                ),
                // height: 120,
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shop by Category",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: heading,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 94,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                  "/category",
                                  arguments: [
                                    _.items[index].id,
                                    _.items[index].name
                                  ],
                                );
                              },
                              child: Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(68),
                                      child: CachedNetworkImage(
                                        imageUrl: _.items[index].image,
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                            color: gold,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        width: 68,
                                        height: 68,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(_.items[index].name)
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 25,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          GetBuilder<HomeControler>(
              init: HomeControler(),
              initState: (_) {},
              builder: (_) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width * .05,
                  ),
                  // height: 120,
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Granite",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: heading,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: width * .32,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _.subs.length,
                            itemBuilder: (BuildContext context, int index) {
                              Category item = _.subs[index];
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    "/subcategory",
                                    arguments: [item.id, item.name],
                                  );
                                },
                                child: Container(
                                  height: width * .35,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: CachedNetworkImage(
                                          imageUrl: item.image,
                                          width: width * .33,
                                          height: width * .24,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(
                                              color: gold,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily,
                                          fontSize: width * .039,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 20,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * .05,
            ),
            // height: 120,
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Marble",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: heading,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: width * .32,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: width * .35,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(
                                  "assets/img/" + items[index],
                                  width: width * .33,
                                  height: width * .24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Aurrora Marble",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontSize: width * .039,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                viewportFraction: 1,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/img/slide.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0, 1, 2, 3, 4].map((e) {
                return Container(
                  margin: EdgeInsets.only(
                    right: 5,
                    top: 10,
                  ),
                  width: current == e ? 22 : 14,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: current == e
                        ? Colors.black
                        : Color(0xff0A0802).withOpacity(.25),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * .05,
            ),
            // height: 120,
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tiles",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: heading,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: width * .32,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: width * .35,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(
                                  "assets/img/marble.png",
                                  width: width * .33,
                                  height: width * .24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Aurrora Marble",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontSize: width * .039,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                viewportFraction: 1,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/img/slide.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0, 1, 2, 3, 4].map((e) {
                return Container(
                  margin: EdgeInsets.only(
                    right: 5,
                    top: 10,
                  ),
                  width: current == e ? 22 : 14,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: current == e
                        ? Colors.black
                        : Color(0xff0A0802).withOpacity(.25),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
