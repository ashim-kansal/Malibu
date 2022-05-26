
import 'dart:convert';

import 'package:Malibu/api/ProductListJson.dart';

class CartItem{

  int count = 1;
  String id = "";
  String name = "";
  String thumbnail = "";
  int price = 0;

  CartItem({required this.count,required  this.id, required this.name,required  this.thumbnail,required  this.price});


  CartItem.fromJson(dynamic json) {
    count= json['count'];
    id= json['id'];
    name= json['name'];
    thumbnail= json['thumbnail'];
    price= json['price'];
  }


  static Map<String, dynamic> toMap(CartItem item) => {
    'count': item.count,
    'id': item.id,
    'name': item.name,
    'thumbnail': item.thumbnail,
    'price': item.price,
  };

  static String encode(List<CartItem> cartItems) => json.encode(
    cartItems
        .map<Map<String, dynamic>>((item) => CartItem.toMap(item))
        .toList(),
  );

  static List<CartItem> decode(String items) =>
      (json.decode(items) as List<dynamic>)
          .map<CartItem>((item) => CartItem.fromJson(item))
          .toList();
}