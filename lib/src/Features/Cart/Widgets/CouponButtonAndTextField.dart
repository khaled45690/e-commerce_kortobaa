import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../Utilities/Style.dart';
import 'CouponTextField.dart';

class CouponButtonAndTextField extends StatelessWidget {
  const CouponButtonAndTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CouponTextField(),
        SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
           color: Colors.white,
           ),
          height: 40,
          width: 95,
         
          child: Center(
            child: Text("apply".tr() , style: cartPartTwoTextStyle,),
          ),
        )
      ],
    );
  }
}