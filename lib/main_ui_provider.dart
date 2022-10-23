import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainUIProvider with ChangeNotifier {
  var _textCounter = 0;

  void setTextCounter() {
    _textCounter++;
    notifyListeners();
  }

  int get textCounter => _textCounter;

  Future<Product?> getListData() async {
    String url = "https://fakestoreapi.com/products";
    try {
      http.Response response = await http.get(Uri.parse(url));
      final productData = json.decode(response.body) as List?;
      if(productData == null) {
        return null;
      }
      final  listProduct = productData.map((e) => Product.fromJson(e)).toList();
      for (var element in listProduct) {
        print("LIST DATA RECEIVE: ${element.rating!.rate},  ${element.rating!.rate.runtimeType}");
      }
    } catch(error) {
      print(error);
      rethrow;
    }
  }
}

class Product {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  num? rate;
  num? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}