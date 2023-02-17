import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sati/components/filterheader.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/single/Product_modal.dart';
import 'package:sati/screens/wishlist/components/book.dart';
import 'package:sati/screens/wishlist/wishlist_controler.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FilterHeader(
                title: "Wishlist",
                clear: "Clear List",
              ),
              SizedBox(
                height: 20,
              ),
              GetBuilder<WishlistControler>(
                  init: WishlistControler(),
                  initState: (_) {},
                  builder: (_) {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * .05,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _.items.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        Product item = _.items[index];
                        bool exist = _.checkitem(item.id);
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: item.images.length > 0
                                      ? item.images[0].imageurl
                                      : dummy,
                                  fit: BoxFit.cover,
                                  height: width * .32,
                                  width: width * .4,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: gold,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  height: width * .32,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
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
                                                item.batchno,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                item.name,
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
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "₹ ${item.sellingprice != null ? item.sellingprice : ""}"),
                                          Text("${item.totalslab} Units"),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showGeneralDialog(
                                            context: context,
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                Book(
                                              item: item,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: gold,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: width * .09,
                                          ),
                                          child: Text("Book Now"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
