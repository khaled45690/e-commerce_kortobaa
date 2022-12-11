import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Utilities/Colors.dart';
import '../../../../Utilities/Style.dart';

class CouponTextField extends StatelessWidget {
  final hint = "enterCouponNumber".tr();
   CouponTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: context.width() - 260,
        height: 40,
        child: TextField(
            cursorColor: mainBlue,
            showCursor: true,
            enabled: false,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 1.5, color: mainBlue)),
              filled: true,
              fillColor: Colors.white.withOpacity(0.4),
              focusColor: mainBlue,
              alignLabelWithHint: true,
              hintStyle: couponTextfieldHintStyle,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      width: 1, color: Colors.white.withOpacity(0.4))),
              hintText: hint,
            )),
      ),
    );
  }
}
