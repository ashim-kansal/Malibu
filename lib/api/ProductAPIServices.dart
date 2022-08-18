
import 'dart:collection';
import 'dart:io';

import 'package:Malibu/api/Cartitem.dart';
import 'package:Malibu/api/CreateOrderRequest.dart';
import 'package:Malibu/api/PaymentAPIServices.dart';
import 'package:Malibu/api/ProductListJson.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:uuid/uuid.dart';

class ProductAPIServices {
  var uuid = Uuid();

  Future<List<Objects>> getProducts() async {
    final String url = "https://connect.squareup.com/v2/catalog/list";
    final response = await http.get(Uri.parse(url), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          "bearer EAAAFAX6i031xWR-DFq476cY1EHa5u2mspiZwLwvcVyy-HQoVbaelcSkj-V0L-OD"
    });
    print(response.body);
    ProductListJson json1 =
        ProductListJson.fromJson(json.decode(response.body));
    List<Objects> cat = [];
    for (var value in json1.objects) {
      if (value.type == "CATEGORY") cat.add(value);
    }

    var p=-1,q=-1,r=-1,s=-1,t=-1,u = -1;



    for(var i=0; i<cat.length; i++){
      String name = cat[i].categoryData.name.toLowerCase();
       if(name.contains("espresso")){
         p = i;
       }else if(name.contains("lemon")){
         q = i;
       }else if(name.contains("tea")){
         r = i;
       }else if(name.contains("food")){
         s = i;
       }else if(name.contains("bakery")){
         t = i;
       }else if(name.contains("choco")){
         u = i;
       }
    }
    List<Objects> catList = [];
    if(p!= -1){
      Objects object = cat[p];
      catList.add(object);
    }
    if(q!= -1){
      Objects object = cat[q];
      catList.add(object);
    }
    if(r!= -1){
      Objects object = cat[r];
      catList.add(object);
    }
    if(s!= -1){
      Objects object = cat[s];
      catList.add(object);
    }
    if(t!= -1){
      Objects object = cat[t];
      catList.add(object);
    }
    if(u!= -1){
      Objects object = cat[u];
      catList.add(object);
    }

    catList.forEach((element) {
      cat.remove(element);
    });
    catList.addAll(cat);


      for (var value in json1.objects) {
      if (value.type == "ITEM") {
        for (var catObj in catList) {
          if (value.itemData.categoryId == catObj.id) {
            catObj.objects.add(value);
          }
        }
      } else if (value.type == "ITEM_OPTION") {
        catList.add(value);
      }
    }

    return catList;
  }
}

Future<String> getImage(id) async {
  final String url = "https://connect.squareup.com/v2/catalog/object/" + id;
  final response = await http.get(Uri.parse(url), headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader:
        "bearer EAAAFAX6i031xWR-DFq476cY1EHa5u2mspiZwLwvcVyy-HQoVbaelcSkj-V0L-OD"
  });
  print(response.body);
  dynamic res = json.decode(response.body);
  if (res['object'] != null && res['object']['image_data'] != null) {
    return res['object']['image_data']['url'];
  }

  return "";
}

Future<List<String>> getImages(List<String> ids) async {
  Map<String, dynamic> map = HashMap();
  map.putIfAbsent("object_ids", () => {ids});
  final String url = "https://connect.squareup.com/v2/catalog/batch-retrieve";
  final response = await http.post(Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            "bearer EAAAFAX6i031xWR-DFq476cY1EHa5u2mspiZwLwvcVyy-HQoVbaelcSkj-V0L-OD"
      },
      body: jsonEncode(<String, List<String>>{"object_ids": ids}));
  print(response.body);
  dynamic res = json.decode(response.body);
  List<String> result = [];
  if (res['objects'] != null) {
    for (int i = 0; i < ids.length; i++) {
      result.add(res['objects'][i]['image_data']['url']);
    }
  }

  return result;
}

Future<Order> createOrder(List<CartItem> items) async {
  List<LineItems> list = [];

  items.forEach((element) {
    list.add(LineItems(
        quantity: element.count.toString(), catalogObjectId: element.id));
  });
  Order order = new Order(locationId: "LNJ205J90XZ5J", lineItems: list);

  CreateOrderRequest request =
      new CreateOrderRequest(idempotencyKey: uuid.v4(), order: order);
  final String url = "https://connect.squareup.com/v2/orders";
  final response = await http.post(Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Square-Version": "2022-05-12",
        HttpHeaders.authorizationHeader:
            "Bearer EAAAFAX6i031xWR-DFq476cY1EHa5u2mspiZwLwvcVyy-HQoVbaelcSkj-V0L-OD"
      },
      body: jsonEncode(request.toJson()));
  print("response from create order " + response.body);
  dynamic res = json.decode(response.body);
  Order result = Order.fromJson(res["order"]);

  return result;
}

Future<String> payOrder(String paymentId, String orderId) async {
  print("OrderId from payOrder " + orderId);

  final String url =
      "https://connect.squareup.com/v2/orders/" + orderId + "/pay";

  final String _uuid = uuid.v4();

  print("body params " +
      jsonEncode({
        "payment_ids": [paymentId],
        "idempotency_key": _uuid
      }));
  final response = await http.post(Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Square-Version": "2022-05-12",
        HttpHeaders.authorizationHeader:
            "Bearer EAAAFAX6i031xWR-DFq476cY1EHa5u2mspiZwLwvcVyy-HQoVbaelcSkj-V0L-OD"
      },
      body: jsonEncode({
        "payment_ids": [paymentId],
        "idempotency_key": _uuid
      }));
  print("final response from the pay order " + response.body);
  dynamic res = json.decode(response.body);
  String id = res["payment"]["id"];

  return id;
}
