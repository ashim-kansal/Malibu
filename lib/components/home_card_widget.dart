import 'package:flutter/material.dart';
import 'package:Malibu/components/AppColors.dart';
import 'package:Malibu/presentation/pages/explore_products_page.dart';

class HomeCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.28,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(26),
                    bottomRight: Radius.circular(26)),
                color: AppColors.app_black),
            child: Container(),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Stack(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/home_card.png'))),
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                            color: AppColors.app_black,
                            border: Border.all(width: 2, color: Colors.white),
                            shape: BoxShape.circle),
                        child: Image.asset('assets/images/app_icon_small.png'),
                      ),
                      Image.asset(
                        'assets/images/english_coffee.jpg',
                        height: 56,
                        width: 110,
                      ),
                      OutlinedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, ExploreProductsPage.RouteName);
                        },
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.color_863f3b,
                                width:1)

                        ),
                        child: const Text(
                          "Explore Now!",
                          style: TextStyle(color: AppColors.app_maroon),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
