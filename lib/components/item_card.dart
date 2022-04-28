import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Malibu/components/AppColors.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Padding(
                padding: EdgeInsets.all(5),
                child: AspectRatio(
                  aspectRatio: 3.0 / 2.8,
                  child: DecoratedBox(
                    // use a custom DecoratedBox to clip the image on the topLeft & topRight corners
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/mg_latte.jpg'),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 9),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Malibu Campfire Coffee Mug ggg ggg',
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$20',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/star.jpg"),
                          Text('4.0'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ItemCartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: Colors.white),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  height: 85,
                  width: 80,
                  child: DecoratedBox(
                    // use a custom DecoratedBox to clip the image on the topLeft & topRight corners
                    decoration: BoxDecoration(

                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/mg_latte.jpg',),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Container(
                height: 85,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Malibu Campfire Coffee Mug',
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.values[4]),
                    ),
                    Text(
                      '\$20',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.values[5]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: RawMaterialButton(
                            onPressed: () {},
                            fillColor: AppColors.app_rating,
                            child: Icon(
                              Icons.remove,
                              size: 15.0,
                              color: Colors.white,
                            ), shape: CircleBorder(),
                          ),

                        ),
                        SizedBox(width: 10,),
                        Text('12', style: TextStyle(color: AppColors.app_rating, fontSize: 14, fontWeight: FontWeight.values[4]),),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: RawMaterialButton(
                            onPressed: () {},
                            fillColor: AppColors.app_rating,
                            child: Icon(
                              Icons.add,
                              size: 15.0,
                              color: Colors.white,
                            ), shape: CircleBorder(),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemExploreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(1),
                child: AspectRatio(
                  aspectRatio: 6/5,
                  child: DecoratedBox(
                    // use a custom DecoratedBox to clip the image on the topLeft & topRight corners
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/dummy_rect2.jpg'),
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Malibu Campfire Coffee Mug ggg ggg',
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$20',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/star.jpg"),
                          Text('4.0'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


