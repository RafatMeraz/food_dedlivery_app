import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseURL = "https://pirox-foodapi.000webhostapp.com";

class Connection{
  BuildContext context;
  Connection(this.context);

  Future<http.Response> getBaseConnection() async{
    try{
      http.Response response = await http.get(baseURL);
      if (response.statusCode == 200){
        return response;
      } else {
        return response;
      }
    } catch (e) {
      print('-------------------------------');
      print(e);
    }
  }

  Future<dynamic> loginUser(String email, String password) async{
    try{
      http.Response response = await http.post(baseURL+'/login', body: {
        "email": email,
        "password": password
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e){
      print(e);
    }
  }

  Future<dynamic> registerUser(String email, String password, String address, String phone, String fullName) async{
    try{
      http.Response response = await http.post(baseURL+'/register', body: {
        "email": email,
        "password": password,
        "address": address,
        "phone": phone,
        "name": fullName
      });
      if (response.statusCode == 200){
        return jsonDecode(response.body);
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(
            'Error : ${response.statusCode}'
          ),
          ),
        );
      }
    } catch (e){
      print(e);
    }
  }
}