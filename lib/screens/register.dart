import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/network/connection.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/reuseable_widget.dart';
import 'main_screen.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool showProgressHUD = false;
  TextEditingController _emailController,
      _phoneController,
      _passwordController,
      _confirmPasswordController,
      _addressController,
      _fullNameController;
  Connection _connection;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _addressController = TextEditingController();
    _fullNameController = TextEditingController();
    _connection = Connection(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _phoneController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      'Register',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500),
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
                                controller: _fullNameController,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InputTextField(
                                hint: 'Phone',
                                suffixIcon: Icons.person,
                                obscureText: false,
                                controller: _phoneController,
                              ),
                              SizedBox(
                                height: 10,
                              ),
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
                                height: 10,
                              ),
                              InputTextField(
                                hint: 'Confirm Password',
                                suffixIcon: Icons.vpn_key,
                                obscureText: true,
                                controller: _confirmPasswordController,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InputTextField(
                                hint: 'Address',
                                suffixIcon: Icons.person,
                                obscureText: false,
                                controller: _addressController,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              RoundButton(
                                labelText: 'Register',
                                onTap: () async {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(_emailController.text.trim());
                                  if (emailValid) {
                                    if (!_passwordController.text.isEmpty) {
                                      if (_passwordController.text ==
                                          _confirmPasswordController.text) {
                                        if (_fullNameController.text
                                            .trim()
                                            .isNotEmpty) {
                                          if (_phoneController.text
                                              .trim()
                                              .isNotEmpty) {
                                            if (_addressController.text
                                                .trim()
                                                .isNotEmpty) {
                                              setState(() {
                                                showProgressHUD = true;
                                              });
                                              var _response = await _connection
                                                  .registerUser(
                                                      _emailController.text
                                                          .trim(),
                                                      _passwordController.text,
                                                      _addressController.text
                                                          .trim(),
                                                      _phoneController.text
                                                          .trim(),
                                                      _fullNameController.text
                                                          .trim());
                                              bool error = _response['error'];
                                              String status =
                                                  _response['status'];
                                              if (error) {
                                                BotToast.showText(
                                                    text: '$status',
                                                    contentColor: Colors.red,
                                                    textStyle: TextStyle(
                                                        color: Colors.white));
                                              } else {
                                                final SharedPreferences prefs =
                                                    await _prefs;
                                                await prefs
                                                    .setString('api_token',
                                                        _response['api_token'])
                                                    .then((bool success) {
                                                  Navigator.pop(context);
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              MainScreen()));
                                                });
                                              }
                                              setState(() {
                                                showProgressHUD = false;
                                              });
                                            } else {
                                              BotToast.showText(
                                                  text: 'Enter your address',
                                                  contentColor: Colors.red,
                                                  textStyle: TextStyle(
                                                      color: Colors.white));
                                            }
                                          } else {
                                            BotToast.showText(
                                                text: 'Enter your phone number',
                                                contentColor: Colors.red,
                                                textStyle: TextStyle(
                                                    color: Colors.white));
                                          }
                                        } else {
                                          BotToast.showText(
                                              text: 'Enter your name',
                                              contentColor: Colors.red,
                                              textStyle: TextStyle(
                                                  color: Colors.white));
                                        }
                                      } else {
                                        BotToast.showText(
                                            text:
                                                'Confirm password does not match!',
                                            contentColor: Colors.red,
                                            textStyle:
                                                TextStyle(color: Colors.white));
                                      }
                                    } else {
                                      BotToast.showText(
                                          text: 'Enter your password',
                                          contentColor: Colors.red,
                                          textStyle:
                                              TextStyle(color: Colors.white));
                                    }
                                  } else {
                                    BotToast.showText(
                                        text: 'Enter an valid email',
                                        contentColor: Colors.red,
                                        textStyle:
                                            TextStyle(color: Colors.white));
                                  }
                                },
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
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          textColor: Colors.blue,
                          onPressed: () {
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
      ),
    );
  }
}
