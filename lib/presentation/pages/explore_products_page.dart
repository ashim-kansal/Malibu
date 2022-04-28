import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/customlist.dart';
import 'package:Malibu/components/item_card.dart';
import 'package:Malibu/presentation/pages/cart_page.dart';
import 'package:Malibu/presentation/pages/product_detail_page.dart';

class ExploreProductsPage extends StatelessWidget {
  static const String RouteName = '/explore_products';

  const ExploreProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Hot Espresso Drinks", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            size: 30.0,
            color: AppColors.color_3f3c3c,
            opacity: 10.0
        ),
        actions: <Widget>[
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Icon(
          //         Icons.search,
          //         size: 26.0,
          //       ),
          //     )
          // ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,CartPage.RouteName);
                },
                child: Icon(
                    Icons.shopping_cart_outlined,
                ),
              )
          ),
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
                childAspectRatio: 1/1.25,
                children: List.generate(20, (index) {
                  return GestureDetector(
                    child: ItemCard(),
                    onTap: (){
                      Navigator.pushNamed(context, ProductDetailPage.RouteName);
                    },
                  );
                })),
          ),
        ],
      ),
    );
  }
}
