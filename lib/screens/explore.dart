import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/models/food.dart';
import 'package:fooddedliveryapp/screens/login.dart';
import 'package:fooddedliveryapp/utils/reuseable_widget.dart';

class Explore extends StatelessWidget {

  List<Food> _cartList = [];

  @override
  Widget build(BuildContext context) {

    final cartsList = Column(
        children: _cartList.map((f){
          return CartFoodCard(
              food:f
          );
        }).toList()
    );


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              'All Foods',
              style: TextStyle(
                  color: Colors.black87
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  FoodDetailsCard(
                    food: _cartList[0],
                  ),
                  FoodDetailsCard(
                    food: _cartList[1],
                  )
                ],
              ),
            )
        )
    );
  }
}

class FoodDetailsCard extends StatelessWidget {
  FoodDetailsCard({@required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('${food.image}'),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${food.name}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 230,
                  child: Text(
                    '${food.description}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.black54
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
//                Text(
//                  '${food.time} to ready',
//                  style: TextStyle(
//                    fontWeight: FontWeight.w500,
//                    fontSize: 15
//                  ),
//                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 230,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '\$${food.price}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.yellow[800]
                        ),
                      ),
                      BorderedButton(
                        labelText: 'Buy',
                        onTap: (){},
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
