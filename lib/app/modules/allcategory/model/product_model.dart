import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String name;
  final int price;
  final int? oldPrice;
  final String? unit;
  final String image;
  final Color? backgroundColor;
  final double? rating;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.oldPrice,
    this.unit,
    required this.image,
    this.backgroundColor,
    this.rating
  });
}
