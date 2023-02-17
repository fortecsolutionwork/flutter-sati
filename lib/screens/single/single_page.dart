import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sati/components/filterheader.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/single/Product_modal.dart';
import 'package:sati/screens/single/components/singlebook.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sati/screens/single/single_controler.dart';
import 'package:sati/screens/wishlist/wishlist_controler.dart';

class SinglePage extends StatefulWidget {
  const SinglePage({super.key});

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  WishlistControler wish = Get.find();
  Product item = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: GetBuilder<SingleControler>(
            init: SingleControler(),
            initState: (_) {},
            builder: (_) {
              bool exist = _.check(item.id.toString());
              return SingleChildScrollView(
                child: Column(
                  children: [
                    FilterHeader(title: item.name),
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * .05,
                        right: width * .05,
                        top: width * .05,
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 250.0,
                          viewportFraction: 1,
                        ),
                        items: [1].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: width,
                                child: CachedNetworkImage(
                                  imageUrl: item.images.length > 0
                                      ? item.images[0].imageurl
                                      : dummy,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: gold,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: width * .05,
                        right: width * .05,
                      ),
                      height: 45,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: item.images.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return CachedNetworkImage(
                            imageUrl: item.images[index].imageurl,
                            height: 40,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                                color: gold,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
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
                                  PopupMenuButton<String>(
                                    icon: Icon(
                                      Icons.share,
                                      size: 20,
                                    ),
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
                                          children: [
                                            SvgPicture.asset(
                                                "assets/svg/gmail.svg"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text('E-mail'),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem<String>(
                                        value: "dfsdf",
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                "assets/svg/whatsapp.svg"),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text('WhatsApp'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            item.batchno,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "₹ ${item.sellingprice != null ? item.sellingprice : ""} /sq ft",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          item.description != null
                              ? Html(
                                  data: item.description,
                                  // style: TextStyle(
                                  //   fontSize: 14,
                                  //   fontWeight: FontWeight.w400,
                                  //   height: 1.4,
                                  // ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * .4,
                                child: Text(
                                  "Size in cm ",
                                  style: TextStyle(
                                    color: Color(0xff647481),
                                  ),
                                ),
                              ),
                              Expanded(
                                child:
                                    Text("${item.length} * ${item.width} cm"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * .4,
                                child: Text(
                                  "Size in inch ",
                                  style: TextStyle(
                                    color: Color(0xff647481),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                    "${(double.parse(item.length.toString()) * .03).toPrecision(2).toString()}  * ${(double.parse(item.width.toString()) * .03).toPrecision(2).toString()}"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * .4,
                                child: Text(
                                  "Thickness",
                                  style: TextStyle(
                                    color: Color(0xff647481),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text("${item.thickness} cm"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * .4,
                                child: Text(
                                  "Availiable",
                                  style: TextStyle(
                                    color: Color(0xff647481),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text("${item.totalslab} piece"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * .4,
                                child: Text(
                                  "Status",
                                  style: TextStyle(
                                    color: Color(0xff647481),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(item.status),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed("/chat");
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: width * .07,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: gold,
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                      "assets/svg/message.svg"),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showGeneralDialog(
                                    context: context,
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        SingleBook(
                                      item: item,
                                    ),
                                  );
                                },
                                child: Container(
                                  width: width * .65,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 17,
                                    horizontal: width * .07,
                                  ),
                                  decoration: BoxDecoration(
                                    color: gold,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
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
