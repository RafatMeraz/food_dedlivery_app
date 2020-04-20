import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/network/connection.dart';
import 'package:fooddedliveryapp/screens/main_screen.dart';
import 'package:fooddedliveryapp/screens/register.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/reuseable_widget.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Connection _connection;
  bool showProgressHUD = false;
  TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    super.initState();
    checkSignin();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _connection = Connection(this.context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  checkSignin() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString('api_token') != null){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (BuildContext context)=> MainScreen()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: ModalProgressHUD(
        inAsyncCall: showProgressHUD,
        child: Center(
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
                                controller: _emailController,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InputTextField(
                                hint: 'Password',
                                suffixIcon: Icons.vpn_key,
                                obscureText: true,
                                controller: _passwordController,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              RoundButton(
                                labelText: 'Login',
                                onTap: () async{
                                  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text.trim());
                                  if (emailValid) {
                                    if (!_passwordController.text.isEmpty) {
                                      setState(() {
                                        showProgressHUD = true;
                                      });
                                      var _response = await _connection
                                          .loginUser(
                                          _emailController.text.trim(),
                                          _passwordController.text);
                                      bool error = _response['error'];
                                      String status = _response['status'];
                                      if (error) {
                                        BotToast.showText(text: '$status',
                                            contentColor: Colors.red,
                                            textStyle: TextStyle(
                                                color: Colors.white));
                                      } else {
                                        final SharedPreferences prefs = await _prefs;
                                        await prefs.setString(
                                            'api_token',
                                            _response['api_token']).then((bool success){
                                          Navigator.pushReplacement(
                                              context, MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MainScreen()
                                          ));
                                        });
                                      }
                                      setState(() {
                                        showProgressHUD = false;
                                      });
                                    } else {
                                      BotToast.showText(text: 'Enter your password',
                                          contentColor: Colors.red,
                                          textStyle: TextStyle(
                                              color: Colors.white));
                                    }
                                  } else {
                                    BotToast.showText(text: 'Enter an valid email',
                                        contentColor: Colors.red,
                                        textStyle: TextStyle(
                                            color: Colors.white));
                                  }
                                },
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
      ),
    );
  }
}

