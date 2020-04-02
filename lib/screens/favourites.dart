import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/models/food.dart';
import 'package:fooddedliveryapp/screens/login.dart';
import 'package:fooddedliveryapp/utils/reuseable_widget.dart';

class Favourties extends StatelessWidget {

  List<Food> _cartList = [
    Food(image: 'assets/images/b.jpg', name: 'Burger', price: 23.30, star: 2, time: 2),
    Food(image: 'assets/images/burger-img.jpg', name: 'Burger', price: 23.30, star: 2, time: 2),
  ];

  @override
  Widget build(BuildContext context) {

    final cartsList = Column(
        children: _cartList.map((f){
          return CartFoodCard(
              food:f
          );
        }).toList()
    );

    final cartsBody = _cartList.isEmpty ? Center(
      child: Text(
          'Cart is Empty'
      ),
    ): Column(
      children: <Widget>[
        cartsList,
      ],
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              'Favourites',
              style: TextStyle(
                  color: Colors.black87
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: cartsBody
        )
    );
  }
}
