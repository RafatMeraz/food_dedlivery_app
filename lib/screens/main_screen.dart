import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/models/food.dart';
import 'package:fooddedliveryapp/models/menu.dart';
import 'package:fooddedliveryapp/network/connection.dart';
import 'package:fooddedliveryapp/screens/carts.dart';
import 'package:fooddedliveryapp/screens/explore.dart';
import 'package:fooddedliveryapp/screens/home.dart';
import 'package:fooddedliveryapp/screens/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [
    Home(),
    Explore(),
    Carts(),
    Profile()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 6,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        unselectedIconTheme: IconThemeData(
          color: Colors.black87,
        ),
        selectedItemColor: Colors.blue,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Carts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile')
          )
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
