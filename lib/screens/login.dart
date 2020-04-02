import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/screens/register.dart';
import '../utils/reuseable_widget.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Card(
                      elevation: 3,
                      child: Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            InputTextField(
                              hint: 'Email',
                              suffixIcon: Icons.alternate_email,
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InputTextField(
                              hint: 'Password',
                              suffixIcon: Icons.vpn_key,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            RoundButton(
                              labelText: 'Login',
                              onTap: (){},
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Forgot your password?'),
                                FlatButton(
                                  child: Text('Click here', style: TextStyle(
                                    fontWeight: FontWeight.w600
                                  ),),
                                  textColor: Colors.blue,
                                  onPressed: (){},
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('New user?'),
                      FlatButton(
                        child: Text('Create a new account', style: TextStyle(
                            fontWeight: FontWeight.w600,
                          fontSize: 16
                        ),),
                        textColor: Colors.blue,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) => Register()
                          ));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

