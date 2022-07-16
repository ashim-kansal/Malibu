

import 'package:Malibu/api/ItemOptionValues.dart';
import 'package:Malibu/api/ItemOptions.dart';
import 'package:Malibu/api/itemOptionData.dart';

class ProductListJson {
  // ProductListJson({
  //   required this.objects,
  // });

  ProductListJson.fromJson(dynamic json) {
    if (json['objects'] != null) {
      objects = [];
      json['objects'].forEach((v) {
        objects.add(Objects.fromJson(v));
      });
    }
  }

  late List<Objects> objects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (objects != null) {
      map['objects'] = objects.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// type : "CATEGORY"
/// id : "RCMQGNJ36BLTV5UHE3NJBJUR"
/// updated_at : "2022-05-05T19:14:39.278Z"
/// created_at : "2022-05-05T19:14:39.278Z"
/// version : 1651778079278
/// is_deleted : false
/// present_at_all_locations : true
/// category_data : {"name":"food"}

class Objects {
  // Objects({
  //   required this.type,
  //   required this.id,
  //   required this.updatedAt,
  //   required this.createdAt,
  //   required this.version,
  //   required this.isDeleted,
  //   required this.presentAtAllLocations,
  //   required this.categoryData,
  // });

  Objects.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    version = json['version'];
    isDeleted = json['is_deleted'];
    presentAtAllLocations = json['present_at_all_locations'];
    if(json['category_data'] != null) {
      categoryData = CategoryData.fromJson(json['category_data']);
    }
    if(json['item_data'] != null){
      itemData= ItemData.fromJson(json['item_data']);
    }
    if(json['item_option_data'] != null){
      itemOptionData= ItemOptionData.fromJson(json['item_option_data']);
    }

  }

  late String type;
  late String id;
  late String updatedAt;
  late String createdAt;
  late int version;
  late bool isDeleted;
  late bool presentAtAllLocations;
  late CategoryData categoryData;
  late ItemData itemData;
  late ItemOptionData itemOptionData;
  List<Objects> objects = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['version'] = version;
    map['is_deleted'] = isDeleted;
    map['present_at_all_locations'] = presentAtAllLocations;
    // if (categoryData != null) {
    //   map['category_data'] = categoryData.toJson();
    // }
    if (itemData != null) {
      map['item_data'] = itemData.toJson();
    }
    if (itemOptionData != null) {
      map['item_option_data'] = itemOptionData.toJson();
    }
    return map;
  }
}

/// name : "food"

class CategoryData {

  String name="";


  CategoryData.fromJson(dynamic json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }
}


/// name : "test"
/// visibility : "PRIVATE"
/// category_id : "RCMQGNJ36BLTV5UHE3NJBJUR"
/// variations : [{"type":"ITEM_VARIATION","id":"DCYC2IJZTXS5PVV27RGX4V6O","updated_at":"2022-05-05T19:14:39.278Z","created_at":"2022-05-05T19:14:39.278Z","version":1651778079278,"is_deleted":false,"present_at_all_locations":true,"item_variation_data":{"item_id":"7WT2F2MFOTWJQZ7F3PP77PNS","name":"Regular","ordinal":1,"pricing_type":"FIXED_PRICING","price_money":{"amount":1000,"currency":"USD"},"track_inventory":false,"sellable":true,"stockable":true}}]
/// product_type : "REGULAR"
/// skip_modifier_screen : false
/// ecom_visibility : "UNINDEXED"
/// image_ids : ["IF3AN736RV26MPDZIGF2DN5U"]

class ItemData {


  ItemData.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'] != null ? json['description'] :"" ;
    categoryId = json['category_id'] != null ? json['category_id'] :"";
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations.add(Variations.fromJson(v));
      });
    }
    if (json['item_options'] != null) {
      item_options = [];
      json['item_options'].forEach((v) {
        item_options.add(ItemOptions.fromJson(v));
      });
    }
    _productType = json['product_type'];
    imageIds = json['image_ids'] != null ? json['image_ids'].cast<String>() : [];
  }
   String name = "";
   String thumbnail = "";
   String description = "";
  String categoryId = "";
  List<Variations> variations = [];
  late String _productType;
  List<String> imageIds=[];
  List<ItemOptions> item_options=[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['category_id'] = categoryId;
    if (variations != null) {
      map['variations'] = variations.map((v) => v.toJson()).toList();
    }
    if (item_options != null) {
      map['item_options'] = item_options.map((v) => v.toJson()).toList();
    }
    map['product_type'] = _productType;
    map['image_ids'] = imageIds;
    return map;
  }


}

/// type : "ITEM_VARIATION"
/// id : "DCYC2IJZTXS5PVV27RGX4V6O"
/// updated_at : "2022-05-05T19:14:39.278Z"
/// created_at : "2022-05-05T19:14:39.278Z"
/// version : 1651778079278
/// is_deleted : false
/// present_at_all_locations : true
/// item_variation_data : {"item_id":"7WT2F2MFOTWJQZ7F3PP77PNS","name":"Regular","ordinal":1,"pricing_type":"FIXED_PRICING","price_money":{"amount":1000,"currency":"USD"},"track_inventory":false,"sellable":true,"stockable":true}

class Variations {

  Variations.fromJson(dynamic json) {
    _type = json['type'];
    id = json['id'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _version = json['version'];
    _isDeleted = json['is_deleted'];
    _presentAtAllLocations = json['present_at_all_locations'];

    if(json['item_variation_data'] != null){
      itemVariationData = ItemVariationData.fromJson(json['item_variation_data']);
    }
  }
  late String _type;
  late String id="";
  late String _updatedAt;
  late String _createdAt;
  late int _version;
  late bool _isDeleted;
  late bool _presentAtAllLocations;
  late ItemVariationData itemVariationData=new ItemVariationData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = id;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['version'] = _version;
    map['is_deleted'] = _isDeleted;
    map['present_at_all_locations'] = _presentAtAllLocations;

    if (itemVariationData != null) {
      map['item_variation_data'] = itemVariationData.toJson();
    }
    return map;
  }

}

/// item_id : "7WT2F2MFOTWJQZ7F3PP77PNS"
/// name : "Regular"
/// ordinal : 1
/// pricing_type : "FIXED_PRICING"
/// price_money : {"amount":1000,"currency":"USD"}
/// track_inventory : false
/// sellable : true
/// stockable : true

class ItemVariationData {

  ItemVariationData(){}

  ItemVariationData.fromJson(dynamic json) {
    _itemId = json['item_id'];
    name = json['name'];
    _ordinal = json['ordinal'];
    _pricingType = json['pricing_type'];
    if(json['price_money'] != null){
      priceMoney = PriceMoney.fromJson(json['price_money']);
    }
    if (json['item_option_values'] != null) {
      itemOptionValues = [];
      json['item_option_values'].forEach((v) {
        itemOptionValues.add(ItemOptionValues.fromJson(v));
      });
    }
    // _trackInventory = json['track_inventory'];
    // _sellable = json['sellable'];
    // _stockable = json['stockable'];
  }
  late String _itemId;
  String name="";
  late int _ordinal;
  late String _pricingType;
   PriceMoney priceMoney = new PriceMoney();
  late bool _trackInventory;
  late bool _sellable;
  late bool _stockable;
  List<ItemOptionValues> itemOptionValues = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = _itemId;
    map['name'] = name;
    map['ordinal'] = _ordinal;
    map['pricing_type'] = _pricingType;
    if (priceMoney != null) {
      map['price_money'] = priceMoney.toJson();
    }
    if (itemOptionValues != null) {
      map['item_option_values'] = itemOptionValues.map((v) => v.toJson()).toList();
    }
    map['track_inventory'] = _trackInventory;
    map['sellable'] = _sellable;
    map['stockable'] = _stockable;
    return map;
  }

}

/// amount : 1000
/// currency : "USD"

class PriceMoney {

  PriceMoney(){}

  PriceMoney.fromJson(dynamic json) {
    amount = json['amount'];
    _currency = json['currency'];
  }
  int amount = 0;
  late String _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['currency'] = _currency;
    return map;
  }

}