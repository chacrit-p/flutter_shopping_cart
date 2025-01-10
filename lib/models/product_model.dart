import 'dart:convert';

import 'package:flutter/services.dart';

class ProductModel {
  final String title;
  final double price;
  final String image;

  ProductModel({
    required this.title,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }

  static Future<List<ProductModel>> fetchProducts() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/jsons/products.json');
      final List<dynamic> jsonResponse = json.decode(jsonString);

      return jsonResponse.map((data) => ProductModel.fromJson(data)).toList();
    } catch (e) {
      return [];
    }
  }
}
