import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/models/food.dart';
import 'package:fooddedliveryapp/network/connection.dart';
import 'package:fooddedliveryapp/utils/contrraints.dart';

class FoodDetails extends StatefulWidget {
  FoodDetails({@required this.food});

  final Food food;

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {

  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Hero(
                        tag: 'food-img',
                        child: Container(
                          height: 230,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(Constraints.baseURL+widget.food.image),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                child: Text(
                                  '${widget.food.name}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              child: Text(
                                '\$${widget.food.price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.amber[800]
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                '${widget.food.time} mins to ready',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '${widget.food.description}',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: isProcessing ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ) : Text(
                  'Add to Carts',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5
                  ),
                ),
              ),
              onTap: () async{
                setState(() {
                  isProcessing = true;
                });
                Connection _connection = Connection(context);
                var _response = await _connection.addToCart(widget.food.id);
                BotToast.showText(
                    text: _response['status'],
                    contentColor: _response['error'] ? Colors.red : Colors.green,
                    textStyle: TextStyle(
                        color: Colors.white
                    )
                );
                setState(() {
                  isProcessing = false;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
