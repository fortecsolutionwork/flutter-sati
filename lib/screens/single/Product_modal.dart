// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
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
    required this.images,
  });

  dynamic id;
  dynamic name;
  dynamic description;
  dynamic batchno;
  dynamic blockno;
  int length;
  int width;
  int lengthInch;
  int widthtInch;
  dynamic status;
  dynamic priceUnit;
  dynamic baseprice;
  dynamic sellingprice;
  int thickness;
  int totalslab;
  List<Img> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
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
        images: List<Img>.from(json["images"].map((x) => Img.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
