import 'package:flutter/cupertino.dart';

class Food{
  final String name, image;
  final int star, time;
  final double price;

  Food({@required this.name, @required this.image, @required this.star, @required this.price, @required this.time});
}