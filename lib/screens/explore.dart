import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/models/food.dart';
import 'package:fooddedliveryapp/network/connection.dart';
import 'package:fooddedliveryapp/screens/login.dart';
import 'package:fooddedliveryapp/utils/reuseable_widget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../utils/contrraints.dart';

class Explore extends StatefulWidget {

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<Food> _foods = [];
  List<Food> _allFoods = [];
  Connection _connection;
  bool showProgress = false;

  @override
  void initState() {
    super.initState();
    _connection = Connection(this.context);
    getFoods();
  }

  getFoods() async{
    setState(() {
      showProgress = true;
    });
    var _response = await _connection.getFoods();
    _foods.clear();
    for (int i=0; i<_response.length; i++){
      _foods.add(
          Food(
              id: _response[i]['id'],
              name: _response[i]['name'],
              image: _response[i]['image'],
              description: _response[i]['description'],
              menuId: _response[i]['menu_id'],
              price: _response[i]['price'],
              time: _response[i]['time']
          )
      );
    }
    setState(() {
      _allFoods = _foods;
      showProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        body: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: _allFoods.map((food){
                    return FoodDetailsCard(food: food);
                  }).toList()
                ),
              )
          ),
        )
    );
  }
}