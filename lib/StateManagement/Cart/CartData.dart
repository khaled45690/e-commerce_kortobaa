// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member

import 'dart:convert';

import 'package:ecommerce_kortobaa/Utilities/GlobalController.dart';
import 'package:ecommerce_kortobaa/Utilities/Prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//BlocStateListener  BlocStateType
class CartCubit extends Cubit<Map> with GlobalController {
  // pass the initial value with super
  CartCubit() : super({"totalItems": 0, "totalPrice": 0});

  // initialize UserData
  Map _cartData = {"totalItems": 0, "totalPrice": 0};

  Map getCartData() {
    return _cartData;
  }

  setCartData(Map cartData) async {
    _cartData = cartData;
    Prefs.setString("CartData", jsonEncode(_cartData));
    emit(_cartData);
  }

  Map? getCartDataFromPref() {
    String? cartDataString = Prefs.getString("CartData");
    if (cartDataString == null) return {};
    Map data = jsonDecode(Prefs.getString("CartData")!);
    _cartData = data;
    emit(_cartData);
    return _cartData;
  }

  addCartItem(Map product) {
    _cartData[product["id"].toString()] = {
      "data": product,
      "quantity": 1,
    };
    _cartData["totalItems"]++;
    _cartData["totalPrice"] += double.parse(product["price"]);
    Prefs.setString("CartData", jsonEncode(_cartData));
    emit({});
    emit(_cartData);
  }

  removeCartItem(String productid) {
    _cartData["totalItems"] -= _cartData[productid]["quantity"];
    _cartData["totalPrice"] -= (_cartData[productid]["quantity"] *
        double.parse(_cartData[productid]["data"]["price"]));
    _cartData.remove(productid);
    emit({});
    Prefs.setString("CartData", jsonEncode(_cartData));
    emit(_cartData);
  }

  increaseCartItem(String productid) {
    _cartData[productid]["quantity"]++;
    _cartData["totalItems"]++;
    _cartData["totalPrice"] +=
        double.parse(_cartData[productid]["data"]["price"]);
    Prefs.setString("CartData", jsonEncode(_cartData));
    emit({});
    emit(_cartData);
  }

  decreaseCartItem(String productid) {
    if (_cartData[productid]["quantity"] > 0) {
      _cartData[productid]["quantity"]--;
      _cartData["totalItems"]--;
      _cartData["totalPrice"] -=
          double.parse(_cartData[productid]["data"]["price"]);
      emit({});
      Prefs.setString("CartData", jsonEncode(_cartData));
      emit(_cartData);
    }
  }
}


//price