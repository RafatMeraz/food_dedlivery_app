import 'package:flutter/cupertino.dart';

class Food{
  final int id;
  final int menuId;
  final String name, image, description;
  final double price;

  Food({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.menuId,
    @required this.price,
    @required this.description
  });
}