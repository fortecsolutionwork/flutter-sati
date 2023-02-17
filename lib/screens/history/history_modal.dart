// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<History> historyFromJson(String str) =>
    List<History>.from(json.decode(str).map((x) => History.fromJson(x)));

String historyToJson(List<History> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class History {
  History({
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
    required this.bookingid,
    required this.bookingunits,
    required this.images,
  });

  dynamic productid;
  dynamic name;
  dynamic description;
  dynamic batchno;
  dynamic blockno;
  dynamic length;
  dynamic width;
  dynamic lengthInch;
  dynamic widthtInch;
  dynamic status;
  dynamic priceUnit;
  dynamic baseprice;
  dynamic sellingprice;
  dynamic thickness;
  dynamic totalslab;
  dynamic bookingid;
  dynamic bookingunits;
  List<Img> images;

  factory History.fromJson(Map<String, dynamic> json) => History(
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
        bookingid: json["bookingid"],
        bookingunits: json["bookingunits"],
        images: List<Img>.from(json["images"].map((x) => Img.fromJson(x))),
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
        "bookingid": bookingid,
        "bookingunits": bookingunits,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Img {
  Img({
    required this.imageurl,
  });

  String imageurl;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        imageurl: json["imageurl"],
      );

  Map<String, dynamic> toJson() => {
        "imageurl": imageurl,
      };
}
