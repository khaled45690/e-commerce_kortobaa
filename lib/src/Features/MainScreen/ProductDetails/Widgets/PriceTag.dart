import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../Utilities/Style.dart';

class PriceTag extends StatelessWidget {
  final double totalPrice;
  const PriceTag(this.totalPrice , {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 50,
      color: Colors.white,
      child: Center(child: Text("${totalPrice.toString()} ${"currency".tr()}", style: cartExpensesPriceTextStyle,),)
    );
  }
}
