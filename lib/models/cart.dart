import 'package:flutter/cupertino.dart';
import 'package:fooddedliveryapp/models/food.dart';

class Cart{
  Food food;
  int item;
  int id, foodId;
  String time;

  Cart({@required this.food, @required this.id, @required this.foodId, @required this.time ,this.item=1});
}