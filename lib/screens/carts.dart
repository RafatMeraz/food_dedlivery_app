import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/models/food.dart';
import 'package:fooddedliveryapp/screens/login.dart';
import 'package:fooddedliveryapp/utils/reuseable_widget.dart';

class Carts extends StatelessWidget {

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

    final trailingOfCarts =  Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Cart Total',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                '\$12.00',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Discount',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                '\$1.00',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Tax',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                '\$0.67',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black87,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Sub Total',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                '\$11.67',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RoundButton(
              labelText: 'Proceed to Checkout',
              onTap:  (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => Login()
                ));
              },
          )
        ],
      ),
    );

    final cartsBody = _cartList.isEmpty ? Center(
      child: Text(
        'Cart is Empty'
      ),
    ): Column(
      children: <Widget>[
        cartsList,
        trailingOfCarts
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'All Carts',
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

class CartFoodCard extends StatefulWidget {
  CartFoodCard({@required this.food});

  final Food food;

  @override
  _CartFoodCardState createState() => _CartFoodCardState();
}

class _CartFoodCardState extends State<CartFoodCard> {
  int item = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                   icon: Icon(
                    Icons.keyboard_arrow_up,
                    size: 30,
                  ),
                  onPressed: (){
                     setState(() {
                       if (item < 10){
                         item++;
                       }
                     });
                  },
                ),
                Text(
                  '$item',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                  onPressed: (){
                    setState(() {
                      if (item > 1)
                      item--;
                    });
                  },
                ),
              ],
            ),
            SizedBox( width: 5,),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                image: DecorationImage(
                  image: AssetImage('${widget.food.image}'),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${widget.food.name}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '\$${widget.food.price}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellow[800]
                  )
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    '${widget.food.time} Min to Ready'
                ),
              ],
            ),
            Spacer(),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(50),
              child: IconButton(
                icon: Icon(
                  Icons.close
                ),
                iconSize: 25,
                onPressed: (){

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
