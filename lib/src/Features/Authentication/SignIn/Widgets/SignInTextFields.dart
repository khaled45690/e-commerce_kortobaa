import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/widgets.dart';

import '../../AuthWidgets/TextFieldWidget.dart';

class SignInTextField extends StatelessWidget {
    final Function(String variableName, String value) onChange;
  final Function() visibiltyChange;
  final Map errorTextsMap;
  final bool isHidden;
  const SignInTextField( this.errorTextsMap, this.isHidden, this.onChange, this.visibiltyChange,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: context.height() / 13,
        ),
        RegistrationTextFieldWidget(
            "userName".tr(), onChange, "username", errorTextsMap["username"]),
        RegistrationTextFieldWidget(
            "password".tr(), onChange, "password", errorTextsMap["password"],
            isPassword: true , isHidden: isHidden , visibiltyChange: visibiltyChange),
      ],
    );
  }
}
