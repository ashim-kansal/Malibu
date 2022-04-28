import 'package:flutter/material.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/ProductDetailPageWidgets.dart';

class ProductDetailPage extends StatelessWidget{
  static const String RouteName = '/productDetail';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.home_bg,
      body: ProductDetailsWidget(
      ),
    );
  }


}