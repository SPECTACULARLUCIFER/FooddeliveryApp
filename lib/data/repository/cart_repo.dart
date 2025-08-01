import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart=[];
  List<String> carHistory=[];
  
  void addToCartList(List<CartModel> cartList){
    //sharedPreferences.remove(AppConstants.CART_LIST);
    //sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    var time =DateTime.now().toString();
    cart=[];

    /*converts objects to string because sharedprefrences only accepts string*/

    cartList.forEach((element){
      element.time = time;
      return cart.add(jsonEncode(element));
     });
  

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    //getCartList();
  }

  List<CartModel> getCartList(){
    List<String> carts=[];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("inside getCartList"+carts.toString());
    }
    List<CartModel> cartList=[];

    carts.forEach((element)=>cartList.add(CartModel.fromJson(jsonDecode(element)))); 
      
     return cartList;
  }
 
  List<CartModel> getCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      //carHistory = [];
      carHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory=[];
    carHistory.forEach((element) =>cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList(){
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      carHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i=0; i<cart.length; i++){
       //print("history list"+cart[i]);
      carHistory.add(cart[i]);
     
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, carHistory);
    print("The length of history list is "+getCartHistoryList().length.toString());
    for (int j=0; j<getCartHistoryList().length; j++){
    print("The time for the order is "+getCartHistoryList()[j].time.toString());
    }
    
  }
  void removeCart(){
    cart=[];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}