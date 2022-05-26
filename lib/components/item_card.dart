import 'package:Malibu/api/Cartitem.dart';
import 'package:Malibu/api/ProductAPIServices.dart';
import 'package:Malibu/api/ProductListJson.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Malibu/components/AppColors.dart';

class ItemCard extends StatelessWidget {

  Objects object;

  ItemCard({required this.object});

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
            this.object.itemData.thumbnail.isNotEmpty  ?
            Padding(
                padding: EdgeInsets.all(5),
                child: AspectRatio(
                  aspectRatio: 3.0 / 2.8,
                  child: DecoratedBox(
                    // use a custom DecoratedBox to clip the image on the topLeft & topRight corners
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        // image: AssetImage('assets/images/mg_latte.jpg'),
                        image: CachedNetworkImageProvider(this.object.itemData.thumbnail),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ))
            : FutureBuilder<String>(
                future: getImage(this.object.itemData.imageIds[0]),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.connectionState == ConnectionState.done) {
                    // if (snapshot.hasError) {
                    //   return Center(child: Text(AppLocalizations.of(context).error),);
                    // }

                      this.object.itemData.thumbnail = snapshot.data!;
                      return Padding(
                          padding: EdgeInsets.all(5),
                          child: AspectRatio(
                            aspectRatio: 3.0 / 2.8,
                            child: DecoratedBox(
                              // use a custom DecoratedBox to clip the image on the topLeft & topRight corners
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: setImage(snapshot.data!),
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(16)),
                              ),
                            ),
                          ));


                    // setState(() {
                    //   widget.therapists = snapshot.data.result;
                    // });

                  }
                  else
                    return Container(
                      child: Center(child: CircularProgressIndicator(),),
                    );
                }),

            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 9),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    object.itemData.name,
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
                        '\$'+(object.itemData.variations[0].itemVariationData.priceMoney.amount/100).toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/star.jpg"),
                          Text('4.0',style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w400),),
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

  setImage(String s) {
    if(s != null) {
      return CachedNetworkImageProvider(s);
    } else{
      return  AssetImage("assets/images/mg_latte.jpg");
    }
  }
}


class ItemCartCard extends StatefulWidget {
  final CartItem item;
  final VoidCallback onAddClick;
  final VoidCallback onMinusClick;

  ItemCartCard({required this.item,required this.onAddClick,required this.onMinusClick});

  @override
  State<StatefulWidget> createState() {
    return ItemCartItemState();
  }
}
class ItemCartItemState extends State<ItemCartCard>{

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
                  height: 100,
                  width: 95,
                  child: DecoratedBox(
                    // use a custom DecoratedBox to clip the image on the topLeft & topRight corners
                    decoration: BoxDecoration(

                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(widget.item.thumbnail),
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
                      widget.item.name,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.values[4]),
                    ),
                    Text(
                      '\$'+((widget.item.price/100)*widget.item.count).toString(),
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
                            onPressed: () {
                                widget.onMinusClick();
                            },
                            fillColor: AppColors.app_rating,
                            child: Icon(
                              Icons.remove,
                              size: 15.0,
                              color: Colors.white,
                            ), shape: CircleBorder(),
                          ),

                        ),
                        SizedBox(width: 10,),
                        Text(widget.item.count.toString(), style: TextStyle(color: AppColors.app_rating, fontSize: 14, fontWeight: FontWeight.values[4]),),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: RawMaterialButton(
                            onPressed: () {
                              widget.onAddClick();

                            },
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


