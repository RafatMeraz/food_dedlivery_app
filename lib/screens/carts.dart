import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/models/cart.dart';
import 'package:fooddedliveryapp/models/food.dart';
import 'package:fooddedliveryapp/network/connection.dart';
import 'package:fooddedliveryapp/screens/login.dart';
import 'package:fooddedliveryapp/utils/reuseable_widget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Carts extends StatefulWidget {

  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  Connection _connection;
  List<Cart> carts = [];
  List<Cart> allCarts = [];
  bool showProgress = false;

  @override
  void initState() {
    super.initState();
    _connection = Connection(context);
    getAllCarts();
  }

  getAllCarts() async{
    setState(() {
      showProgress = true;
    });
    carts.clear();
    var _response = await _connection.getCarts();
    print(_response);
    for (int i=0; i < _response.length; i++){
      print(_response[i]);
      carts.add(Cart(
        id: _response[i]['id'],
        food: Food(
            id: _response[i]['food']['id'],
            name: _response[i]['food']['name'],
            image: _response[i]['food']['image'],
            description: _response[i]['food']['description'],
            menuId: _response[i]['food']['menu_id'],
            price: _response[i]['food']['price'],
            time: _response[i]['food']['time']
        ),
        foodId: _response[i]['food_id'],
        time: _response[i]['add_time'],
      ));
    }
    setState(() {
      allCarts = carts;
      showProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    final cartsList = Column(
      children: allCarts.map((f){
        return CartFoodCard(
            food: f.food
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

    final cartsBody = allCarts.isEmpty ? Center(
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
      body: ModalProgressHUD(
        inAsyncCall: showProgress,
        child: SingleChildScrollView(
            child: cartsBody
        ),
      )
    );
  }
}