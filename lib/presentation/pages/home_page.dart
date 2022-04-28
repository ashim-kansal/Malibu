import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/customlist.dart';
import 'package:Malibu/components/home_card_widget.dart';
import 'package:Malibu/components/item_card.dart';
import 'package:Malibu/presentation/pages/cart_page.dart';
import 'package:Malibu/presentation/pages/explore_products_page.dart';
import 'package:Malibu/presentation/pages/product_detail_page.dart';

class HomePage extends StatelessWidget {
  static const String RouteName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.home_bg,
      appBar: AppBar(
        backgroundColor: AppColors.app_black,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 48,
                width: 48,
                child: Image.asset('assets/images/appicon_48.jpg'),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset('assets/images/home_name.jpg'),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: ListView(
            children: [
              HomeCardWidget(),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(20, (index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hot Espresso Drinks',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              ),
                              GestureDetector(
                                onTap:(){
                                  Navigator.pushNamed(context, ExploreProductsPage.RouteName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color:AppColors.app_blue,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: AppColors.app_blue
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                                    child: Text(
                                      'See all',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: GestureDetector(
                                    child: ItemCard(),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ProductDetailPage.RouteName);
                                    },
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: GestureDetector(
                                    child: ItemCard(),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ProductDetailPage.RouteName);
                                    },
                                  )),
                            ],
                          )
                        ],
                      );
                    })),
              ),
            ],
          )),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.white,
          //     child: Padding(
          //       padding: EdgeInsets.all(18),
          //       child: Row(
          //         mainAxisSize: MainAxisSize.max,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           DecoratedBox(
          //             decoration: BoxDecoration(
          //                 borderRadius:
          //                     const BorderRadius.all(Radius.circular(26)),
          //                 color: AppColors.app_blue),
          //             child: Padding(
          //               padding: EdgeInsets.all(6),
          //               child: Row(
          //                 mainAxisSize: MainAxisSize.min,
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 children: [
          //                   DecoratedBox(
          //                     decoration: BoxDecoration(
          //                         borderRadius: const BorderRadius.all(
          //                             Radius.circular(15)),
          //                         color: Colors.white),
          //                     child: Padding(
          //                       padding: EdgeInsets.all(6),
          //                       child: Image.asset('assets/images/ic_home.jpg'),
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                   Text('Home',
          //                       style: TextStyle(
          //                           color: Colors.white, fontSize: 18)),
          //                   SizedBox(
          //                     width: 10,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           GestureDetector(
          //             child: RichText(
          //               text: TextSpan(
          //                 children: [
          //                   WidgetSpan(
          //                     alignment: PlaceholderAlignment.middle,
          //                     child: Icon(
          //                       Icons.search,
          //                       size: 24,
          //                       color: AppColors.color_9fabc0,
          //                     ),
          //                   ),
          //                   TextSpan(
          //                       text: " Search",
          //                       style: TextStyle(
          //                           color: AppColors.color_6d6f7e,
          //                           fontSize: 18)),
          //                 ],
          //               ),
          //             ),
          //             onTap: () {
          //               Navigator.pushNamed(
          //                   context, ExploreProductsPage.RouteName);
          //             },
          //           ),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           GestureDetector(
          //             child: RichText(
          //               text: TextSpan(
          //                 children: [
          //                   WidgetSpan(
          //                     alignment: PlaceholderAlignment.middle,
          //                     child: Icon(
          //                       Icons.shopping_cart_outlined,
          //                       size: 24,
          //                       color: AppColors.color_9fabc0,
          //                     ),
          //                   ),
          //                   TextSpan(
          //                       text: " Cart",
          //                       style: TextStyle(
          //                           color: AppColors.color_6d6f7e,
          //                           fontSize: 18)),
          //                 ],
          //               ),
          //             ),
          //             onTap: () {
          //               Navigator.pushNamed(context, CartPage.RouteName);
          //             },
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
