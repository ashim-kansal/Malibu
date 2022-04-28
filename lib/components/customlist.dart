import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/home_card_widget.dart';
import 'package:Malibu/components/item_card.dart';
import 'package:Malibu/presentation/pages/cart_page.dart';
import 'package:Malibu/presentation/pages/explore_products_page.dart';
import 'package:Malibu/presentation/pages/product_detail_page.dart';


// class MyHomeLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

class MyExploreLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.175,
                  children: List.generate(20, (index) {
                    return GestureDetector(
                      child: ItemExploreCard(),
                      onTap: (){
                        Navigator.pushNamed(context, ProductDetailPage.RouteName);
                      },
                    );
                  })),
            ),
          ],
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.sort,
                            size: 24,
                            color: AppColors.color_3f3c3c,
                          ),
                        ),
                        TextSpan(
                            text: " SORT",
                            style: TextStyle(
                                color: AppColors.color_3f3c3c, fontSize: 18)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    child: Container(color: AppColors.home_bg,),
                  ),
                  GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.filter_list_alt,
                              size: 24,
                              color: AppColors.color_3f3c3c,
                            ),
                          ),
                          TextSpan(
                              text: " FILTER",
                              style: TextStyle(
                                  color: AppColors.color_3f3c3c, fontSize: 18)),
                        ],
                      ),
                    ),
                    onTap: (){
                    },
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

