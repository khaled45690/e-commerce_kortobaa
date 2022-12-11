import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/GlobalController.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../../../../StateManagement/UserData/UserData.dart';
import '../../../../../Utilities/Strings.dart';
import '../../../MainScreen/MainScreen.dart';
import '../SignIn.dart';
import 'package:flutter/material.dart';

abstract class SignInControl extends State<SignIn> with GlobalController {
  // Declaring and initializing variables Section////////////////////////////////
  bool isHidden = true; //
  Map signInData = {"username": null, "password": null},
      signInDataError = {}; //
  bool isLoading = false; //
  //  End section of Declaring and initializing variables////////////////////////

  signIn() async {
    if (_nullCheck()) return;
    isLoading = true;
    setState(() {});
    _removeUnwantedWhiteSpaces();
    Response response = await HttpPost(signInAPI, signInData);
    Map responseData = jsonDecode(response.body);

    isLoading = false;
    setState(() {});

    if (response.statusCode >= 300) return context.snackBar(response.body);

    context.read<UserCubit>().setUserData(responseData);
    context.navigateTo(MainScreen());
  }

  visibiltyChange() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  onChange(String variableName, String value) {
    setState(() {
      signInData[variableName] = value;
      signInDataError[variableName] = null;
    });
  }

  bool _nullCheck() {
    bool check = false;
    signInData.keys.forEach((key) => {
          if (signInData[key] == null)
            {
              setState(() {
                check = true;
                signInData[key] = "fieldRequired".tr();
              })
            }
        });
    return check;
  }

  _removeUnwantedWhiteSpaces() {
    signInData["username"] = signInData["username"].replaceAll(' ', '');
    signInData["password"] = signInData["password"].replaceAll(' ', '');
  }
}
