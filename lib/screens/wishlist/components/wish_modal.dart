// To parse this JSON data, do
//
//     final wishlist = wishlistFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Wishlist> wishlistFromJson(String str) =>
    List<Wishlist>.from(json.decode(str).map((x) => Wishlist.fromJson(x)));

String wishlistToJson(List<Wishlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Wishlist {
  Wishlist({
    required this.productid,
    required this.name,
    required this.description,
    required this.batchno,
    required this.blockno,
    required this.length,
    required this.width,
    required this.lengthInch,
    required this.widthtInch,
    required this.status,
    required this.priceUnit,
    required this.baseprice,
    required this.sellingprice,
    required this.thickness,
    required this.totalslab,
    required this.wishlistid,
    required this.images,
  });

  int productid;
  String name;
  dynamic description;
  String batchno;
  String blockno;
  int length;
  int width;
  dynamic lengthInch;
  dynamic widthtInch;
  String status;
  dynamic priceUnit;
  dynamic baseprice;
  dynamic sellingprice;
  int thickness;
  int totalslab;
  int wishlistid;
  List<Image> images;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        productid: json["productid"],
        name: json["name"],
        description: json["description"],
        batchno: json["batchno"],
        blockno: json["blockno"],
        length: json["length"],
        width: json["width"],
        lengthInch: json["length_inch"],
        widthtInch: json["widtht_inch"],
        status: json["status"],
        priceUnit: json["price_unit"],
        baseprice: json["baseprice"],
        sellingprice: json["sellingprice"],
        thickness: json["thickness"],
        totalslab: json["totalslab"],
        wishlistid: json["wishlistid"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productid": productid,
        "name": name,
        "description": description,
        "batchno": batchno,
        "blockno": blockno,
        "length": length,
        "width": width,
        "length_inch": lengthInch,
        "widtht_inch": widthtInch,
        "status": status,
        "price_unit": priceUnit,
        "baseprice": baseprice,
        "sellingprice": sellingprice,
        "thickness": thickness,
        "totalslab": totalslab,
        "wishlistid": wishlistid,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    required this.imageurl,
  });

  String imageurl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageurl: json["imageurl"],
      );

  Map<String, dynamic> toJson() => {
        "imageurl": imageurl,
      };
}
