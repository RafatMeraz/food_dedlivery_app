import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/models/food.dart';
import 'package:fooddedliveryapp/models/menu.dart';
import 'package:fooddedliveryapp/network/connection.dart';
import '../utils/reuseable_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Connection _connection;
  List<Menu> menus = [];
  List<Menu> allMenus = [];
  List<Food> foods = [];
  List<Food> allFoods = [];

  final themeTextStyle =  TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  @override
  void initState() {
    super.initState();
    _connection = Connection(this.context);
    getMenus();
    getFoods();
  }

  getMenus() async{
    menus.clear();
    var response = await _connection.getMenus();
    print(response);
    for (int i=0; i<response.length; i++){
      menus.add(Menu(id: response[i]['id'], name: response[i]['name'], image: response[i]['image'], items: response[i]['items']));
    }
    setState(() {
      allMenus = menus;
    });
  }

  getFoods() async{
    var response = await _connection.getFoods();
    print(response);
    foods.clear();
    for (int i=0; i<response.length; i++){
      foods.add(
          Food(
              id: response[i]['id'],
              name: response[i]['name'],
              image: response[i]['image'],
              description: response[i]['description'],
              menuId: response[i]['menu_id'],
              price: response[i]['price'],
              time: response[i]['time']
          )
      );
    }
    setState(() {
      allFoods = foods;
    });
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
          children: allMenus.map((menu){
            return MenuCard(
              image: menu.image,
              kinds: "${menu.items} items",
              menuName: menu.name,
            );
          }).toList()
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
      children: allFoods.map((food){
        return FoodItemCard(
            foodName: food.name,
            image: food.image,
            price: food.price,
            time: food.time,
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

