import 'dart:ui';

import 'package:Malibu/api/ProductListJson.dart';
import 'package:Malibu/components/MyBadge.dart';
import 'package:Malibu/services/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/customlist.dart';
import 'package:Malibu/components/item_card.dart';
import 'package:Malibu/presentation/pages/cart_page.dart';
import 'package:Malibu/presentation/pages/product_detail_page.dart';

class ExploreProductsPage extends StatefulWidget {
  static const String RouteName = '/explore_products';


  ExplorePageArguments data;

  ExploreProductsPage({required this.data});

  @override
  State<StatefulWidget> createState() {
    return ExploreProductsPageState();
  }
}

class ExploreProductsPageState extends State<ExploreProductsPage> {
  int cartCount = 0;

  @override
  void initState() {
    super.initState();
    getCartCount();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.data.product.categoryData.name, style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            size: 30.0,
            color: AppColors.color_3f3c3c,
            opacity: 10.0
        ),
        actions: <Widget>[
          MyBadge(
            top: 8,
            right: 8,
            value: this.cartCount.toString(),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CartPage.RouteName).then((value) => getCartCount());
                },
                child: Container(
                  width: 30,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 24,
                    color: AppColors.color_9fabc0,
                  ),
                ),
              ),
            ),
          )

        ],
      ),

      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1/1.27,
                children: List.generate(widget.data.product.objects.length, (index) {
                  return GestureDetector(
                    child: ItemCard(object: widget.data.product.objects[index]),
                    onTap: (){
                      var product = widget.data.product.objects[index];
                      var arg;
                      if(product.itemData.item_options.isNotEmpty){
                        List<Objects> option = [];
                        List<String> opt = product.itemData.item_options.map((e) => e.itemOptionId).toList();
                        option.addAll(widget.data.options);

                        option.retainWhere((obj){
                          return opt.contains(obj.id);
                        });

                        arg = ProductDetailArguments(product, option);
                      }else{
                        arg = ProductDetailArguments(product, []);
                      }
                      Navigator.pushNamed(context, ProductDetailPage.RouteName, arguments: arg).then((value) => getCartCount());
                    },
                  );
                })),
          ),
        ],
      ),
    );
  }

  void getCartCount() {
    Helper.getItemCountFromCart().then((value) => {
      if (value != null)
        {
          setState(() {
            this.cartCount = value;
          })
        }
    });
  }
}

class ExplorePageArguments{
  final List<Objects> options;
  final Objects product;

  ExplorePageArguments(this.product, this.options);
}
