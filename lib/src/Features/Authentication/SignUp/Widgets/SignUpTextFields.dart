import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../../AuthWidgets/TextFieldWidget.dart';

class SignUpTextFields extends StatelessWidget {
  final Function(String variableName, String value) onChange;
  final Function(String variableName) visibiltyChange;
  final Map errorTextsMap;
  final Map<String, bool> isHidden;
  const SignUpTextFields( this.errorTextsMap, this.isHidden, this.onChange, this.visibiltyChange,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: context.height() / 50,
        ),
        RegistrationTextFieldWidget(
            "userName".tr(), onChange, "username", errorTextsMap["username"]),
        RegistrationTextFieldWidget(
            "email".tr(), onChange, "email", errorTextsMap["email"]),
        RegistrationTextFieldWidget("firstName".tr(), onChange, "first_name",
            errorTextsMap["first_name"]),
        RegistrationTextFieldWidget("lastName".tr(), onChange, "last_name",
            errorTextsMap["last_name"]),
        RegistrationTextFieldWidget(
            "password".tr(), onChange, "password", errorTextsMap["password"],
            isPassword: true,
            visibiltyChange: ()=> visibiltyChange("password"),
            isHidden: isHidden["password"]!),
        RegistrationTextFieldWidget("confirmPassword".tr(), onChange,
            "confirmPassword", errorTextsMap["confirm_password"],
            isPassword: true,
            visibiltyChange: ()=> visibiltyChange("confirmPassword"),
            isHidden: isHidden["confirmPassword"]!),
      ],
    );
  }
}
