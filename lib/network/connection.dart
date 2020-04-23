import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/models/food.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseURL = "https://pirox-foodapi.000webhostapp.com";

class Connection{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
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

  Future<dynamic> getMenus() async{
    try{
      var token = await getAPIToken();
      http.Response _response = await http.post(baseURL+'/menu', body: {
        'api_token': token
      });
      if (_response.statusCode == 200){
        return jsonDecode(_response.body);
      } else {
        print(_response.statusCode);
      }
    } catch(e){
      print(e);
    }
  }

  Future<dynamic> getFoods() async{
    try{
      var token = await getAPIToken();
      http.Response _response = await http.post(baseURL+'/foods', body: {
        'api_token': token
      });
      if (_response.statusCode == 200){
        return jsonDecode(_response.body);
      } else {
        print(_response.statusCode);
      }
    } catch(e){
      print(e);
    }
  }

  Future<dynamic> addToCart(int foodId) async{
    try {
      var token = await getAPIToken();
      var userId = await getUserId();
      print("$userId $foodId");
      http.Response _response = await http.post(baseURL + '/addtocarts', body: {
        'api_token': token,
        'customer_id': "$userId",
        'food_id': "$foodId"
      });
      if (_response.statusCode == 200) {
        return jsonDecode(_response.body);
      } else {
        print(_response.statusCode);
      }
    } catch (e){
      print(e);
    }
  }

  Future<String> getAPIToken() async{
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString('api_token') != null){
      return prefs.getString('api_token');
    } else {
      return null;
    }
  }
  Future<int> getUserId() async{
    final SharedPreferences prefs = await _prefs;
    if (prefs.getInt('id') != null){
      return prefs.getInt('id');
    } else {
      return null;
    }
  }
}