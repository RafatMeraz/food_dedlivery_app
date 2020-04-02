import 'package:flutter/cupertino.dart';
import 'package:fooddedliveryapp/models/food.dart';

class Cart{
  Food food;
  int item;

  Cart({@required this.food, this.item = 1});
}