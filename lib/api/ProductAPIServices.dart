
import 'dart:collection';
import 'dart:io';

import 'package:Malibu/api/ProductListJson.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductAPIServices {

  Future<List<Objects>> getProducts() async {

  final String url = "https://connect.squareup.com/v2/catalog/list";
  final response = await
  http.get(Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : "bearer EAAAFAX6i031xWR-DFq476cY1EHa5u2mspiZwLwvcVyy-HQoVbaelcSkj-V0L-OD"
      }
  );
  print(response.body);
  ProductListJson json1 =  ProductListJson.fromJson(json.decode(response.body));
  List<Objects> cat = [];
  for (var value in json1.objects) {
    if(value.type == "CATEGORY")
      cat.add(value);
  }
  for (var value in json1.objects) {
    if(value.type == "ITEM") {
      for (var catObj in cat) {
        if(value.itemData.categoryId == catObj.id){
          catObj.objects.add(value);
        }
      }
    }else if(value.type == "ITEM_OPTION"){
      cat.add(value);
    }
  }

  return cat;
}


}

Future<String> getImage(id) async {

  final String url = "https://connect.squareup.com/v2/catalog/object/"+id;
  final response = await
  http.get(Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : "bearer EAAAFAX6i031xWR-DFq476cY1EHa5u2mspiZwLwvcVyy-HQoVbaelcSkj-V0L-OD"
      }
  );
  print(response.body);
  dynamic res = json.decode(response.body);
  if (res['object'] != null && res['object']['image_data'] != null) {
    return  res['object']['image_data']['url'];
  }

  return "";
}


Future<List<String>> getImages(List<String> ids) async {

  Map<String, dynamic> map = HashMap();
  map.putIfAbsent("object_ids", () => {ids});
  final String url = "https://connect.squareup.com/v2/catalog/batch-retrieve";
  final response = await
  http.post(Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : "bearer EAAAFAX6i031xWR-DFq476cY1EHa5u2mspiZwLwvcVyy-HQoVbaelcSkj-V0L-OD"
      },
    body: jsonEncode(<String, List<String>>{
      "object_ids": ids
    })
  );
  print(response.body);
  dynamic res = json.decode(response.body);
  List<String> result = [];
  if (res['objects'] != null) {
    for(int i=0; i<ids.length; i++){
      result.add(res['objects'][i]['image_data']['url']);
    }
  }

  return result;
}
