import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/GlobalController.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:ecommerce_kortobaa/src/Features/MainScreen/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../../../../StateManagement/UserData/UserData.dart';
import '../../../../../Utilities/Strings.dart';
import '../Model/SignUpModel.dart';
import '../SignUp.dart';

abstract class SignUpController extends State<SignUp> with GlobalController {
  // Declaring and initializing variables Section////////////////////////////////
  Map<String, bool> isHidden = {"password": true, "confirmPassword": true}; //
  Map signUpData = SignUpModel().toMap(), signUpDataError = {}; //
  bool isLoading = false; //
  //  End section of Declaring and initializing variables///////////////////////

  visibiltyChange(variableName) {
    setState(() {
      isHidden[variableName] = !isHidden[variableName]!;
    });
  }

  onChange(String variableName, String value) {
    setState(() {
      signUpData[variableName] = value;
      signUpDataError[variableName] = null;
    });
  }

  signup() async {
    if (_nullCheck()) return;
    if (_emailCheck()) return;
    if (_unMatchPassword()) return;
    isLoading = true;
    setState(() {});
    _removeUnwantedWhiteSpaces();

    signUpData.remove("confirmPassword");
    Response response = await HttpPost(registerAPI, signUpData);
    Map responseData = jsonDecode(response.body);
    if (response.statusCode >= 300) {
      signUpData["confirmPassword"] = signUpData["password"];
      try {
        context.snackBar(responseData["username"][0]);
        signUpDataError["username"] = responseData["username"][0];
      } catch (e) {}

      isLoading = false;
      setState(() {});
      return;
    }
    Map signInData = {
      "username": signUpData["username"],
      "password": signUpData["password"]
    };
    response = await HttpPost(signInAPI, signInData);
    responseData = jsonDecode(response.body);
    isLoading = false;
    setState(() {});

    if (response.statusCode >= 300) return context.snackBar(response.body);

    context.read<UserCubit>().setUserData(responseData);
    context.navigateTo(MainScreen());
  }

  bool _nullCheck() {
    bool check = false;
    signUpData.keys.forEach((key) => {
          if (signUpData[key] == null)
            {
              setState(() {
                check = true;
                signUpDataError[key] = "fieldRequired".tr();
              })
            }
        });
    return check;
  }

  bool _emailCheck() {
    // ^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$
    bool emailCheck;

    RegExp alphanumeric =
        RegExp(r'^[a-z0-9](\.?[a-z0-9]){5,}@[a-z0-9-]+\.com$');
    emailCheck = alphanumeric.hasMatch(signUpData["email"]);
    if (!emailCheck) {
      setState(() {
        signUpDataError["email"] = "emailFormat".tr();
      });
    }

    return !emailCheck;
  }

  bool _unMatchPassword() {
    bool unMatchPassword;
    unMatchPassword = signUpData["password"] == signUpData["confirmPassword"];
    if (!unMatchPassword) {
      setState(() {
        signUpDataError["password"] = "passwordConfirmation".tr();
        signUpDataError["confirmPassword"] = "passwordConfirmation".tr();
      });
    }
    return !unMatchPassword;
  }

  _removeUnwantedWhiteSpaces() {
    signUpData["email"] = signUpData["email"].replaceAll(' ', '');
    signUpData["password"] = signUpData["password"].replaceAll(' ', '');
  }
}
