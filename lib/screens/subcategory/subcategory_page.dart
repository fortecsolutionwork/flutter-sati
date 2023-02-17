import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sati/components/commonheader.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/single/Product_modal.dart';
import 'package:sati/screens/subcategory/SubcategoryControler.dart';
import 'package:sati/screens/wishlist/wishlist_controler.dart';

class SubCategoryPage extends StatefulWidget {
  const SubCategoryPage({super.key});

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  dynamic id = Get.arguments[0];
  dynamic title = Get.arguments[1];
  int selected = 0;
  List<String> items = [
    "All",
    "New",
    "Blocks",
    "Gangsaw",
    "Cutters",
    "Tiles",
    "Best Seller",
    "Offer"
  ];

  SubControler sub = Get.put(SubControler());
  WishlistControler wish = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sub.getsubcategory(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: GetBuilder<SubControler>(
            init: SubControler(),
            initState: (_) {},
            builder: (_) {
              return SingleChildScrollView(
                controller: _.scrollController,
                child: Column(
                  children: [
                    CommonHeader(
                      title: title,
                    ),
                    Container(
                      height: 35,
                      margin: EdgeInsets.only(
                        top: 15,
                        bottom: 5,
                        left: width * .05,
                      ),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6.5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: gold,
                                  width: 2,
                                ),
                                color: selected == index
                                    ? gold
                                    : Colors.transparent,
                              ),
                              child: Text(
                                items[index],
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: gold,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Sort by:',
                                style: TextStyle(
                                  color: grey,
                                ),
                              ),
                              TextSpan(
                                text: ' Popularity',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  color: Color(0xff252525),
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(Icons.arrow_drop_down),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          initialValue: "selectedMenu",
                          // Callback that sets the selected popup menu item.
                          onSelected: (String item) {
                            print(item);
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "dfsdf",
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Popularity'),
                                  Radio<String>(
                                    value: "false",
                                    groupValue: "_character",
                                    onChanged: (String? value) {},
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "dfsdf",
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Price -- Low to High'),
                                  Radio<String>(
                                    value: "false",
                                    groupValue: "_character",
                                    onChanged: (String? value) {},
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "dfsdf",
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Price -- Low - High'),
                                  Radio<String>(
                                    value: "false",
                                    groupValue: "_character",
                                    onChanged: (String? value) {},
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "dfsdf",
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Newest First'),
                                  Radio<String>(
                                    value: "false",
                                    groupValue: "_character",
                                    onChanged: (String? value) {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * .05,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _.items.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        Product item = _.items[index];
                        bool exist = wish.checkitem(item.id.toString());
                        return InkWell(
                          onTap: () {
                            Get.toNamed("/single", arguments: item);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: width * .05,
                            ),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(
                                    0,
                                    2,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: CachedNetworkImage(
                                            imageUrl: item.images.length > 0
                                                ? item.images[0].imageurl
                                                : dummy,
                                            width: width * .35,
                                            height: width * .25,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Center(
                                              child: CircularProgressIndicator(
                                                color: gold,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: width * .35,
                                          height: 20,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: item.images.length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox(
                                                width: 7,
                                              );
                                            },
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CachedNetworkImage(
                                                imageUrl:
                                                    item.images[index].imageurl,
                                                width: 30,
                                                height: 20,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: gold,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        height: width * .25 + 25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.batchno.toString(),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  item.name.toString(),
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                        GoogleFonts.roboto()
                                                            .fontFamily,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _.additem(item);
                                              },
                                              child: SvgPicture.asset(
                                                exist
                                                    ? "assets/svg/heartfilled.svg"
                                                    : "assets/svg/heart.svg",
                                                height: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Size",
                                          style: TextStyle(
                                            color: Color(0xff647481),
                                          ),
                                        ),
                                        Text(
                                          "${item.length.toString()} cm * ${item.width.toString()} cm",
                                          style: TextStyle(
                                            color: Color(0xff37414A),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Thickness",
                                          style: TextStyle(
                                            color: Color(0xff647481),
                                          ),
                                        ),
                                        Text(
                                          "${item.thickness.toString()} cm",
                                          style: TextStyle(
                                            color: Color(0xff37414A),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.status.toString(),
                                          style: TextStyle(
                                            color: Color(0xff647481),
                                          ),
                                        ),
                                        Text(
                                          "${item.totalslab.toString()} pieces",
                                          style: TextStyle(
                                            color: Color(0xff37414A),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹ ${item.sellingprice != null ? item.sellingprice.toString() : ""} /sq.ft",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: gold,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width: width * .4,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Center(
                                        child: Text("Request price"),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    _.loading == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: gold,
                            ),
                          )
                        : SizedBox(
                            height: 20,
                          ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
