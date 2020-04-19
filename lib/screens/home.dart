import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/models/food.dart';
import 'package:fooddedliveryapp/network/connection.dart';
import '../utils/reuseable_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final themeTextStyle =  TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  List<Food> _foodList = [
    Food(image: 'assets/images/b.jpg', name: 'Burger', price: 23.30, star: 2, time: 2, description: ''),
    Food(image: 'assets/images/burger-img.jpg', name: 'Burger', price: 23.30, star: 2, time: 2, description: ''),
    Food(image: 'assets/images/b.jpg', name: 'Burger', price: 23.30, star: 2, time: 2, description: ''),
    Food(image: 'assets/images/b.jpg', name: 'Burger', price: 23.30, star: 2, time: 2, description: ''),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    networkTask();
  }

  networkTask()async {

  }

  @override
  Widget build(BuildContext context) {

    // Top level theme text setion
    final mainThemeText = Container(
              margin: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          'What you',
                        style: themeTextStyle
                      ),
                      Text(
                          'would like to eat? ',
                        style: themeTextStyle,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_none,
                    color: Colors.lightBlue,
                    size: 30,
                  )
                ],
              ),
            );

    // Menu Items Sections
    final menuItems = Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            MenuCard(
              menuName: 'Burgers',
              image: 'assets/images/burger.png',
              kinds: '11 Kinds',
            ),
            MenuCard(
              menuName: 'Pizza',
              image: 'assets/images/pizza.png',
              kinds: '7 Kinds',
            ),
            MenuCard(
              menuName: 'Soup',
              image: 'assets/images/soup.png',
              kinds: '6 Kinds',
            ),
            MenuCard(
              menuName: 'Chicken',
              image: 'assets/images/chicken.png',
              kinds: '75 Kinds',
            ),
          ],
        ),
      ),
    );

    // Search bar section
    final searchBar = Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(50),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Search food',
              suffixIcon: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(50),
                child: Icon(
                  Icons.search,
                  color: Colors.black87,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 30),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none
              )
          ),
        ),
      ),
    );

    final textLabelWidget = Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Frequently purchased foods',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16
            ),
          ),
          FlatButton(
            child: Text(
              'View All',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.yellow[800]
              ),
            ),
            onPressed: (){},
          )
        ],
      ),
    );

    final foodListView = Column(
      children: _foodList.map((food){
        return FoodItemCard(
            foodName: food.name,
            image: food.image,
            time: food.time,
            price: food.price,
            star: food.star
        );
      }).toList(),
    );

    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              mainThemeText,
              menuItems,
              searchBar,
              SizedBox(
                height: 20,
              ),
              textLabelWidget,
              foodListView,
            ],
          ),
        ),
    );
  }
}

