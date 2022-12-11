// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../Utilities/Colors.dart';
import '../../../../../Utilities/Style.dart';

class SearchTextField extends StatelessWidget {
  final String hint = "";
  final Function(String variableName, String value) onChange;

  const SearchTextField(this.onChange);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: context.width() > 500 ? 400 : context.width() - 80,
        height: 40,
        child: TextField(


            cursorColor: mainBlue,
            // onChanged: (value) => onChange(variableName, value),
            showCursor: true,
            enabled: false,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(60) ,borderSide: BorderSide(width: 1.5, color: mainBlue)),
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white.withOpacity(0.4),
              focusColor: mainBlue,
              alignLabelWithHint: true,
            
              hintStyle: textfieldHintStyle,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(60) ,borderSide: BorderSide(width: 0)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(60) ,borderSide: BorderSide(width: 1 , color: Colors.white.withOpacity(0.4))),
              hintText: hint,
            )),
      ),
    );
  }
}
