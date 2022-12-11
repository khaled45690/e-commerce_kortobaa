import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../StateManagement/Cart/CartData.dart';
import '../../../../Utilities/Style.dart';

class CartTotalInfo extends StatelessWidget {
  const CartTotalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    String totalPrice = context
        .watch<CartCubit>()
        .state["totalPrice"]
        .toString();
    int totalItems = context.watch<CartCubit>().state["totalItems"];
    return Container(
      decoration: cartWidgetDecoration,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 40),
      width: context.width() - 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "($totalItems) ",
                style: cartPartOneTextStyle,
              ),
              Text(
                itemText(context.locale, totalItems),
                style: cartPartTwoTextStyle,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "totalPrice".tr(),
                style: cartPartOneTextStyle,
              ),
              Text(
                ":${totalPrice.length > 6 ? totalPrice.substring(0,6) : totalPrice} ",
                style: cartPartTwoTextStyle,
              ),
              Text(
                "currency".tr(),
                style: cartPartTwoTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String itemText(Locale locale, int totalItems) {
    if (locale == const Locale('en', '')) return totalItems > 1 ? "items".tr() : "item".tr();

    if (totalItems > 1 && totalItems < 10) return "items".tr();


    return "item".tr();
  }
}
