 

import 'package:Malibu/api/Cartitem.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String valueSharedPrefrences = 'MyPrefs';
  
// Write DATA
static Future<bool> addItemInCart(CartItem value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<CartItem> items = await getItemsFromCart();
    if(checkItem(items, value)) {
      int i = items.indexWhere((element) => element.id == value.id);
      items[i].count = items[i].count + value.count;
    }else {
      // items.removeWhere((element) => element.id == value.id);
      items.add(value);
    }
    String val = CartItem.encode(items);
    return await sharedPreferences.setString(valueSharedPrefrences, val);
  }

  static bool checkItem(List<CartItem> list, CartItem obj){
    for (var value in list) {
        if(value.id == obj.id)
          return true;
    }
    return false;
  }
static Future<bool> removeItemInCart(CartItem value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<CartItem> items = await getItemsFromCart();
    items.removeWhere((item) => item.id == value.id);
    String val = CartItem.encode(items);
    return await sharedPreferences.setString(valueSharedPrefrences, val);
  }

  static Future<bool> updateItemCountInCart(List<CartItem> items) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String val = CartItem.encode(items);
    return await sharedPreferences.setString(valueSharedPrefrences, val);
  }
    
// Read Data
static Future<List<CartItem>> getItemsFromCart() async {
  List<CartItem> items = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? cartString = await sharedPreferences.getString(valueSharedPrefrences);
    if(cartString != null && cartString!.isNotEmpty)
      items = CartItem.decode(cartString!);

    return items;
  }

  static void clearCart() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}