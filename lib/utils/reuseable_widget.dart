import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/network/connection.dart';
import 'package:fooddedliveryapp/screens/food_details.dart';
import 'package:progress_indicator_button/progress_button.dart';
import '../models/food.dart';
import 'contrraints.dart';

class FoodItemCard extends StatelessWidget {
  FoodItemCard({@required this.food});

  final Food food;
  Constraints constraints = Constraints();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context)=> FoodDetails(food: food)
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('${Constraints.baseURL+ food.image}'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Opacity(
                  opacity: 0.4,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.black87
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 10.0,
                right: 10.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${food.name}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey,
                            ),
                          ],
                        )

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '\$${food.price}',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          '${food.time} Min to Ready',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  MenuCard({@required this.image, @required this.menuName, @required this.kinds});

  final String image;
  final String menuName;
  final String kinds;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: <Widget>[
            Container(
                width: 100,
                height: 80,
                child: Image.network('${Constraints.baseURL+ image}')
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$menuName',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  child: Text(
                      '$kinds'
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  InputTextField({@required this.hint, @required this.suffixIcon, @required this.obscureText, @required this.controller});

  final String hint;
  final IconData suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(suffixIcon, color: Colors.black87,),
          hintText: '$hint',
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue
              )
          )
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({@required this.labelText, @required this.onTap});

  final String labelText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 2,
            )
          ]
        ),
        child: Text(
          '$labelText',
          style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class FoodDetailsCard extends StatelessWidget {
  FoodDetailsCard({@required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) => FoodDetails(food: food)
        ));
      },
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage('${Constraints.baseURL+food.image}'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${food.name}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
//                SizedBox(
//                  height: 5,
//                ),
//                Container(
//                  width: MediaQuery.of(context).size.width - 190,
//                  child: Text(
//                    '${food.description}',
//                    overflow: TextOverflow.ellipsis,
//                    maxLines: 5,
//                    style: TextStyle(
//                        color: Colors.black54
//                    ),
//                  ),
//                ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${food.time} mins to ready',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 190,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '\$${food.price}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.yellow[800]
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 35,
                          child: ProgressButton(
                            borderRadius: BorderRadius.circular(20),
                            child: Text(
                              'Buy',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onPressed: (AnimationController _controller) async{
                              _controller.forward();
                              Connection _connection = Connection(context);
                              var _response = await _connection.addToCart(food.id);
                              BotToast.showText(
                                  text: _response['status'],
                                  contentColor: _response['error'] ? Colors.red : Colors.green,
                                  textStyle: TextStyle(
                                      color: Colors.white
                                  )
                              );
                              _controller.reverse();
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartFoodCard extends StatefulWidget {
  CartFoodCard({@required this.food});

  final Food food;

  @override
  _CartFoodCardState createState() => _CartFoodCardState();
}

class _CartFoodCardState extends State<CartFoodCard> {
  int item = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_up,
                    size: 30,
                  ),
                  onPressed: (){
                    setState(() {
                      if (item < 10){
                        item++;
                      }
                    });
                  },
                ),
                Text(
                  '$item',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                  onPressed: (){
                    setState(() {
                      if (item > 1)
                        item--;
                    });
                  },
                ),
              ],
            ),
            SizedBox( width: 5,),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  image: DecorationImage(
                      image: AssetImage('${widget.food.image}'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${widget.food.name}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    '\$${widget.food.price}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.yellow[800]
                    )
                ),
//                SizedBox(
//                  height: 5,
//                ),
//                Text(
//                    '${widget.food.time} Min to Ready'
//                ),
              ],
            ),
            Spacer(),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(50),
              child: IconButton(
                icon: Icon(
                    Icons.close
                ),
                iconSize: 25,
                onPressed: (){

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BorderedButton extends StatelessWidget {
  BorderedButton({@required this.onTap, @required this.labelText});

  final String labelText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.blue, width: 3),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: Text(
            '$labelText',
            style: TextStyle(
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}
