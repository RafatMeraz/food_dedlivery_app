import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodItemCard extends StatelessWidget {
  FoodItemCard({@required this.foodName, @required this.image, @required this.time, @required this.price, @required this.star});

  final String foodName;
  final double price;
  final int time;
  final int star;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      image: AssetImage('$image'),
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
                        '$foodName',
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
                        '\$$price',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        '$time Min to Ready',
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
                child: Image.asset('$image')
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
  InputTextField({@required this.hint, @required this.suffixIcon, @required this.obscureText});

  final String hint;
  final IconData suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
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
                SizedBox(
                  height: 5,
                ),
                Text(
                    '${widget.food.time} Min to Ready'
                ),
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
