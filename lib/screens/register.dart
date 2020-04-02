import 'package:flutter/material.dart';
import '../utils/reuseable_widget.dart';

class Register extends StatelessWidget {
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
                    'Register',
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
                              hint: 'Full name',
                              suffixIcon: Icons.person,
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                              height: 10,
                            ),
                            InputTextField(
                              hint: 'Confirm Password',
                              suffixIcon: Icons.vpn_key,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            RoundButton(
                              labelText: 'Register',
                              onTap: (){},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Aleardy have an account?'),
                      FlatButton(
                        child: Text('Login', style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),),
                        textColor: Colors.blue,
                        onPressed: (){
                          Navigator.pop(context);
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


