import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/screens/home.dart';
import 'package:fooddedliveryapp/screens/login.dart';
import 'package:fooddedliveryapp/screens/main_screen.dart';

main() => runApp(FoodDeliveryApp());

class FoodDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        navigatorObservers: [BotToastNavigatorObserver()],//2.registered route observer
      ),
    );
  }
}
