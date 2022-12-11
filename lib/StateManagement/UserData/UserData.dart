// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member

import 'dart:convert';

import 'package:ecommerce_kortobaa/Utilities/GlobalController.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Utilities/Prefs.dart';

//BlocStateListener  BlocStateType
class UserCubit extends Cubit<Map?> {
  // pass the initial value with super
  UserCubit() : super(null);

  // initialize UserData
  Map? _userData;

  Map? getUserData() {
    return _userData;
  }

  setUserData(Map userData) async {
    _userData = userData;
    Prefs.setString("UserData", jsonEncode(_userData));
    emit(_userData);
  }

  Map? getUserDataFromPref() {
    String? userDataString = Prefs.getString("UserData");
    if (userDataString == null) return null;
    Map data = jsonDecode(Prefs.getString("UserData")!);
    _userData = data;
    emit(_userData);
    return _userData;
  }
}
