import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../StateManagement/Cart/CartData.dart';
import '../../../../Utilities/Style.dart';

class ExpensesWidget extends StatefulWidget {
  const ExpensesWidget({super.key});

  @override
  State<ExpensesWidget> createState() => _ExpensesWidgetState();
}

class _ExpensesWidgetState extends State<ExpensesWidget> {
  @override
  Widget build(BuildContext context) {
    String totalPrice =
        (context.watch<CartCubit>().state["totalPrice"] + 40).toString();
    return Container(
      decoration: cartWidgetDecoration,
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.all(20),
      width: context.width() - 50,
      height: context.height() / 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "totalPrice".tr(),
                style: productPriceTextStyle,
              ),
              Text(
                "${totalPrice.length > 6 ? totalPrice.substring(0, 6) : totalPrice} ${"currency".tr()}",
                style: cartExpensesPriceTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "taxes".tr(),
                style: productPriceTextStyle,
              ),
               Text(
                "40 ${"currency".tr()}",
                style: cartExpensesPriceTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
