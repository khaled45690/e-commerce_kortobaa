import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../StateManagement/Cart/CartData.dart';
import '../Authentication/AuthWidgets/AuthButton.dart';
import 'Widgets/ExpensesWidget.dart';
import 'Widgets/CartItemCard.dart';
import 'Widgets/CartTotalInfo.dart';
import 'Widgets/CouponWidget.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    List itemsList = mapToList(context.watch<CartCubit>().state);
    return SingleChildScrollView(
      child: SizedBox(
        width: context.width(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 80,
          ),
          const CartTotalInfo(),
          for (int i = 0; i < itemsList.length; i++) CartItemCard(itemsList[i]),
          const SizedBox(
            height: 30,
          ),
          const CouponWidget(),
          const ExpensesWidget(),
          AuthButton("purchase".tr(), () {}, false),
         const  SizedBox(height: 100,)
        ]),
      ),
    );
  }
}

List mapToList(Map items) {
  List itemsList = [];
  items.forEach((key, value) {
    if (value is Map) itemsList.add(value);
  });

  return itemsList;
}
