import 'package:Malibu/components/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/components/ProductDetailPageWidgets.dart';

class CustomizedPageView extends StatefulWidget {
  CustomizedPageView({Key? key}) : super(key: key);

  @override
  _CustomizedPageViewState createState() => _CustomizedPageViewState();
}

class _CustomizedPageViewState extends State<CustomizedPageView> {
  String bal = '0';
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final panels = Container(
        height: 200,
        child:  PageView.builder(
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        controller: PageController(initialPage: 0),


        // itemCount: 3,
        itemBuilder: (context, index) {
          return ProductImagePagerItem();
        })
    );

    return  Container(
      child: Column(children: <Widget>[
        panels,
        // Stack(
        //   children: <Widget>[
        Container(
          margin: EdgeInsets.all(15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < 5; i++)
                (i == currentPage ? circleBar(true) : circleBar(false))
            ],
          ),
        ),
        //   ],
        // ),
      ]),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? AppColors.app_blue : AppColors.color_cdd1d9,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

class ProductImagePagerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: AppColors.app_pink,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/home_card.png'))),
        child: Container(),
      ),);
  }
}

