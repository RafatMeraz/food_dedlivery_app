import 'package:flutter/cupertino.dart';

class Food{
  final int id;
  final int menuId, time;
  final String name, image, description;
  final int price;

  Food({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.menuId,
    @required this.price,
    @required this.description,
    @required this.time
  });
}