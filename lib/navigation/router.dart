
import 'package:Malibu/api/ProductListJson.dart';
import 'package:Malibu/components/OptionDialog.dart';
import 'package:flutter/material.dart';
import 'package:Malibu/components/UndefinedView.dart';
import 'package:Malibu/presentation/pages/cart_page.dart';
import 'package:Malibu/presentation/pages/explore_products_page.dart';
import 'package:Malibu/presentation/pages/home_page.dart';
import 'package:Malibu/presentation/pages/product_detail_page.dart';
import 'package:Malibu/presentation/pages/splash.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Splash.RouteName:
      return MaterialPageRoute(builder: (context) => Splash());
    case HomePage.RouteName:
      return MaterialPageRoute(builder: (context) => HomePage());
    case CartPage.RouteName:
      return MaterialPageRoute(builder: (context) => CartPage());
    case ExploreProductsPage.RouteName:
      final ExplorePageArguments args =  settings.arguments as ExplorePageArguments;
      return MaterialPageRoute(builder: (context) => ExploreProductsPage(data: args));
    case ProductDetailPage.RouteName:
      final ProductDetailArguments args =  settings.arguments as ProductDetailArguments;
      return MaterialPageRoute(builder: (context) => ProductDetailPage(data: args));
    case SelectOptionDialog.RouteName:
      final SelectOptionDialogArguments args =  settings.arguments as SelectOptionDialogArguments;
      return MaterialPageRoute(builder: (context) => SelectOptionDialog(data: args));
      default:
      return MaterialPageRoute(builder: (context) => UndefinedView(name: "settings.name"));
  }
}