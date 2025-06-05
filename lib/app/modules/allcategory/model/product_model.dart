import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';

import '../../product_details/views/product_details_view.dart';

class ProductModel {
  final String name;
  final int price;
  final int? oldPrice;
  final String? unit;
  final String image;
  final Color? backgroundColor;

  const ProductModel({
    required this.name,
    required this.price,
    this.oldPrice,
    this.unit,
    required this.image,
    this.backgroundColor,
  });
}