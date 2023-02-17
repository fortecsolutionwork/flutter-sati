import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sati/components/commonheader.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/category/categorycontroler.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var id = Get.arguments[0];
  String title = Get.arguments[1];
  List<String> items = [
    "pr1.png",
    "pr2.png",
    "pr3.png",
    "pr4.png",
    "pr5.png",
    "pr1.png",
    "pr2.png",
    "pr3.png",
    "pr4.png",
    "pr5.png"
  ];

  CategoryControler cat = Get.put(CategoryControler());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cat.getcatbyid(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CategoryControler>(
            init: CategoryControler(),
            initState: (_) {},
            builder: (_) {
              return SingleChildScrollView(
                controller: _.scrollController,
                child: Column(
                  children: [
                    CommonHeader(
                      title: title,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GridView.count(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .05,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: width * .05,
                      crossAxisSpacing: width * .05,
                      childAspectRatio: 1.04 / 1,
                      // crossAxisCount is the number of columns
                      crossAxisCount: 2,
                      // This creates two columns with two items in each column
                      children: _.items
                          .map((item) => InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    "/subcategory",
                                    arguments: [item.id, item.name],
                                  );
                                },
                                child: Container(
                                  height: width * .28 + 10,
                                  width: width / 2 - (width * .1),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          imageUrl: item.image,
                                          width: width / 2 - (width * .05),
                                          height: width * .33,
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
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    _.loading == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: gold,
                            ),
                          )
                        : SizedBox(
                            height: 20,
                          )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
