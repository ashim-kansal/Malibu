import 'dart:ui';

import 'package:Malibu/api/ProductAPIServices.dart';
import 'package:Malibu/api/ProductListJson.dart';
import 'package:Malibu/components/MyBadge.dart';
import 'package:Malibu/services/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/customlist.dart';
import 'package:Malibu/components/home_card_widget.dart';
import 'package:Malibu/components/item_card.dart';
import 'package:Malibu/presentation/pages/cart_page.dart';
import 'package:Malibu/presentation/pages/explore_products_page.dart';
import 'package:Malibu/presentation/pages/product_detail_page.dart';

class HomePage extends StatefulWidget {
  static const String RouteName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {
  List<Objects> dataList = [];
  int cartCount = 0;

  @override
  void initState() {
    super.initState();
    getProducts();
    getCartCount();
  }

  @override
  Widget build(BuildContext context) {
    List<Objects> data = [];
    data.addAll(dataList);
    data.retainWhere((obj) {
      return obj.type == "CATEGORY" && obj.objects.length > 0;
    });
    return Scaffold(
      backgroundColor: AppColors.home_bg,
      appBar: AppBar(
        backgroundColor: AppColors.app_black,
        elevation: 0,
        centerTitle: true,
        title: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/home_logo.jpg',
                  height: 44,
                  color: Colors.white,
                ),
              ],
            )),
        actions: [
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: ListView(
            children: [
              Container(
                child: HomeCardWidget(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(data.length, (index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[index].categoryData.name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: () {
                                  List<Objects> options = [];
                                  options.addAll(dataList);

                                  options.retainWhere((obj) {
                                    return obj.type == "ITEM_OPTION";
                                  });
                                  var args = ExplorePageArguments(
                                      data[index], options);
                                  Navigator.pushNamed(
                                      context, ExploreProductsPage.RouteName,
                                      arguments: args).then((value) => getCartCount());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.app_blue,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: AppColors.app_blue),
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
                                  child: data[index].objects.length > 0
                                      ? GestureDetector(
                                          child: ItemCard(
                                              object: data[index].objects[0]),
                                          onTap: () {
                                            var product =
                                                data[index].objects[0];
                                            var arg;
                                            if (product.itemData.item_options
                                                .isNotEmpty) {
                                              List<Objects> options = [];
                                              List<String> opt = product
                                                  .itemData.item_options
                                                  .map((e) => e.itemOptionId)
                                                  .toList();
                                              options.addAll(dataList);

                                              options.retainWhere((obj) {
                                                return obj.type ==
                                                        "ITEM_OPTION" &&
                                                    opt.contains(obj.id);
                                              });

                                              arg = ProductDetailArguments(
                                                  product, options);
                                            } else {
                                              arg = ProductDetailArguments(
                                                  product, []);
                                            }
                                            Navigator.pushNamed(context,
                                                ProductDetailPage.RouteName,
                                                arguments: arg).then((value) => getCartCount());
                                          },
                                        )
                                      : Container()),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: data[index].objects.length > 1
                                      ? GestureDetector(
                                          child: ItemCard(
                                              object: data[index].objects[1]),
                                          onTap: () {
                                            var product =
                                                data[index].objects[1];
                                            var arg;
                                            if (product.itemData.item_options
                                                .isNotEmpty) {
                                              List<Objects> options = [];
                                              List<String> opt = product
                                                  .itemData.item_options
                                                  .map((e) => e.itemOptionId)
                                                  .toList();
                                              options.addAll(dataList);

                                              options.retainWhere((obj) {
                                                return obj.type ==
                                                        "ITEM_OPTION" &&
                                                    opt.contains(obj.id);
                                              });

                                              arg = ProductDetailArguments(
                                                  product, options);
                                            } else {
                                              arg = ProductDetailArguments(
                                                  product, []);
                                            }
                                            Navigator.pushNamed(context,
                                                ProductDetailPage.RouteName,
                                                arguments: arg).then((value) => getCartCount());
                                          },
                                        )
                                      : Container()),
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

  void getProducts() {
    ProductAPIServices productAPIServices = new ProductAPIServices();

    productAPIServices.getProducts().then((value) => {
          if (value != null)
            {
              setState(() {
                this.dataList = value;
              })
            }
        });
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
