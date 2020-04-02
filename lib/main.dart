import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/screens/home.dart';
import 'package:fooddedliveryapp/screens/main_screen.dart';

main() => runApp(FoodDeliveryApp());

class FoodDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
