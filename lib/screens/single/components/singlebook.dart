import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/history/history_controler.dart';
import 'package:sati/screens/single/Product_modal.dart';
import 'package:sati/screens/single/single_controler.dart';

class SingleBook extends StatefulWidget {
  final Product item;
  const SingleBook({super.key, required this.item});

  @override
  State<SingleBook> createState() => _SingleBookState();
}

class _SingleBookState extends State<SingleBook> {
  String value = "cm";
  int qty = 1;
  SingleControler single = Get.find();
  @override
  Widget build(BuildContext context) {
    Product item = widget.item;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder<HistoryControler>(
          init: HistoryControler(),
          initState: (_) {},
          builder: (_) {
            return SizedBox(
              height: height,
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
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
                                      width: 61,
                                      height: 61,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.batchno,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
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
                              Text(
                                item.batchno,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Quantity/pc"),
                                    SizedBox(
                                      width: width * .15,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (qty == 1) return;
                                            setState(() {
                                              qty = qty - 1;
                                            });
                                          },
                                          child: Container(
                                            height: width * .1,
                                            width: width * .1,
                                            decoration: BoxDecoration(
                                              color: gold,
                                              borderRadius:
                                                  const BorderRadius.only(
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
                                          decoration: const BoxDecoration(
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
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                              ),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                  "assets/svg/plus.svg"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * .1,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Size ',
                                          style: TextStyle(
                                            color: heading,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ' (inch)',
                                          style: TextStyle(
                                            color: Color(0xff647481),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Size ',
                                          style: TextStyle(
                                            color: grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ' (cm)',
                                          style: TextStyle(
                                            color: Color(0xff647481),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: width * .225,
                              ),
                              Text(
                                  "${value == "inches" ? (double.parse(item.width.toString()) * .03).toPrecision(2).toString() : item.width}  *  ${value == "inches" ? (double.parse(item.length.toString()) * .03).toPrecision(2).toString() : item.length}"),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: width * .1,
                                padding: const EdgeInsets.only(
                                  left: 9,
                                  right: 9,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffF8F6F0),
                                ),
                                child: Row(
                                  children: [
                                    Text(value),
                                    Container(
                                      width: 20,
                                      child: PopupMenuButton<String>(
                                        icon: const Icon(
                                          Icons.arrow_drop_down,
                                          size: 20,
                                        ),
                                        shape: const RoundedRectangleBorder(
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
                                                const Text('cm'),
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem<String>(
                                            value: "inches",
                                            child: Row(
                                              children: [
                                                const Text('Inches'),
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
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Price"),
                                    Container(
                                      height: width * .1,
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffF8F6F0),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(item.sellingprice != null
                                              ? item.sellingprice.toString()
                                              : ""),
                                          SizedBox(
                                            width: width * .115,
                                          ),
                                          const Text("₹"),
                                          PopupMenuButton<String>(
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              size: 20,
                                            ),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            initialValue: "selectedMenu",
                                            // Callback that sets the selected popup menu item.
                                            onSelected: (String item) {
                                              print(item);
                                            },
                                            itemBuilder:
                                                (BuildContext context) =>
                                                    <PopupMenuEntry<String>>[
                                              PopupMenuItem<String>(
                                                value: "dfsdf",
                                                child: Row(
                                                  children: [
                                                    const Text('Cm'),
                                                  ],
                                                ),
                                              ),
                                              PopupMenuItem<String>(
                                                value: "dfsdf",
                                                child: Row(
                                                  children: [
                                                    const Text('Inches'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * .1,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _.loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: gold,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    _.book(single.id, qty);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: gold,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: width * .09,
                                    ),
                                    child: const Center(
                                        child: Text(
                                      "Proceed to email",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )),
                                  ),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: blue,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
