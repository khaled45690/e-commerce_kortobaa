// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Utilities/Colors.dart';
import '../../../../Utilities/Style.dart';

class RegistrationTextFieldWidget extends StatelessWidget {
  final String hint = "", variableName, upperText;
  final bool isPassword, isHidden;
  final String? errorText;
  final Function()? visibiltyChange;
  final Function(String variableName, String value) onChange;

  const RegistrationTextFieldWidget(this.upperText, this.onChange,
      this.variableName, this.errorText,
      {this.isPassword = false, this.isHidden = true, this.visibiltyChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10 , right: 10 , bottom: 5),
          child: Text(
            upperText,
            style: textFieldUpperTextStyle,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: context.width() > 500 ? 400 : context.width() - 60,
          child: TextField(
              cursorColor: mainBlue,
              onChanged: (value) => onChange(variableName, value),
              showCursor: true,
              enabled: true,
              textAlignVertical: TextAlignVertical.center,
              obscureText: isPassword
                  ? isHidden
                      ? true
                      : false
                  : false,
              decoration: InputDecoration(
                suffixIcon: isPassword
                    ? IconButton(

                        icon: isHidden
                            ? const Icon(FontAwesomeIcons.solidEyeSlash)
                            : const Icon(FontAwesomeIcons.solidEye),
                        onPressed: visibiltyChange,
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                alignLabelWithHint: true,
                hintStyle: textfieldHintStyle,
                errorText: errorText,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: hint,
              )),
        )
      ],
    );
  }
}
