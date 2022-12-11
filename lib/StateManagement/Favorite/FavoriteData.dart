// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member

import 'dart:convert';

import 'package:ecommerce_kortobaa/Utilities/GlobalController.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Utilities/Prefs.dart';

//BlocStateListener  BlocStateType
class FavoriteCubit extends Cubit<Map> with GlobalController {
  // pass the initial value with super
  FavoriteCubit() : super({});

  // initialize UserData
  Map _favoriteData = {};

  Map getFavorite() {
    return _favoriteData;
  }

  setFavorite(Map favoriteData) async {
    _favoriteData = favoriteData;
    Prefs.setString("Favorite", jsonEncode(_favoriteData));
    emit(_favoriteData);
  }

  Map? getFavoriteFromPref() {
    String? favoriteDataString = Prefs.getString("Favorite");
    if (favoriteDataString == null) return {};
    Map data = jsonDecode(Prefs.getString("Favorite")!);
    _favoriteData = data;
    emit(_favoriteData);
    return _favoriteData;
  }

  addFavoriteItem(Map product) {
    _favoriteData[product["id"].toString()] = product;
    Prefs.setString("Favorite", jsonEncode(_favoriteData));
    emit({});
    emit(_favoriteData);
  }

  removeFavoriteItem(String productid) {
    Map filtered = {};
    _favoriteData.remove(productid);
    emit({});
    Prefs.setString("Favorite", jsonEncode(_favoriteData));
    emit(_favoriteData);
  }
}
