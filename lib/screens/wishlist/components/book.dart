import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/history/history_controler.dart';
import 'package:sati/screens/single/Product_modal.dart';
import 'package:sati/screens/wishlist/components/success.dart';

class Book extends StatefulWidget {
  final Product item;
  const Book({super.key, required this.item});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  String value = "cm";
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    Product item = widget.item;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: height,
        width: width,
        child: GetBuilder<HistoryControler>(
            init: HistoryControler(),
            initState: (_) {},
            builder: (_) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: width * .9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                    child: Image.network(
                                      item.images.length > 0
                                          ? item.images[0].imageurl
                                          : dummy,
                                      width: width * .25,
                                      height: width * .25,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Container(
                                          width: width * .25,
                                          height: width * .25,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: gold,
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.batchno,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.close),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * .3,
                                child: Text("Quantity/pc"),
                              ),
                              InkWell(
                                onTap: () {
                                  if (qty != 1) {
                                    setState(() {
                                      qty = qty - 1;
                                    });
                                  }
                                },
                                child: Container(
                                  height: width * .1,
                                  width: width * .1,
                                  decoration: BoxDecoration(
                                    color: gold,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                        "assets/svg/delete.svg"),
                                  ),
                                ),
                              ),
                              Container(
                                height: width * .1,
                                width: width * .15,
                                decoration: BoxDecoration(
                                  color: Color(0xffF8F6F0),
                                ),
                                child: Center(
                                  child: Text(qty.toString()),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    qty = qty + 1;
                                  });
                                },
                                child: Container(
                                  height: width * .1,
                                  width: width * .1,
                                  decoration: BoxDecoration(
                                    color: gold,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: Center(
                                    child:
                                        SvgPicture.asset("assets/svg/plus.svg"),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * .3,
                                child: Text("Size"),
                              ),
                              Text(
                                  "${value == "inches" ? (double.parse(item.width.toString()) * .03).toPrecision(2).toString() : item.width} * ${value == "inches" ? (double.parse(item.length.toString()) * .03).toPrecision(2).toString() : item.length}"),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: width * .1,
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffF8F6F0),
                                ),
                                child: Row(
                                  children: [
                                    Text(value),
                                    Container(
                                      width: 20,
                                      child: PopupMenuButton<String>(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
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
                                          setState(() {
                                            value = item;
                                          });
                                        },
                                        itemBuilder: (BuildContext context) =>
                                            <PopupMenuEntry<String>>[
                                          PopupMenuItem<String>(
                                            value: "cm",
                                            child: Row(
                                              children: [
                                                Text('cm'),
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem<String>(
                                            value: "inches",
                                            child: Row(
                                              children: [
                                                Text('Inches'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹ ${item.sellingprice != null ? item.sellingprice : ""}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              _.loading
                                  ? SizedBox(
                                      height: 40,
                                      width: 146,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: gold,
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () async {
                                        print("${item.name} , ${item.id}");
                                        bool status =
                                            await _.booking(item.id, qty);
                                        if (status) {
                                          Get.back();
                                          showGeneralDialog(
                                            context: context,
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                Success(),
                                          );
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: gold,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        height: 40,
                                        width: 146,
                                        child: Center(
                                          child: Text("Book"),
                                        ),
                                      ),
                                    )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
