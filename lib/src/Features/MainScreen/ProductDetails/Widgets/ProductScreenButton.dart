import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../StateManagement/Cart/CartData.dart';
import '../../../../../Utilities/Colors.dart';
import '../../../../../Utilities/Style.dart';

class ProductScreenButton extends StatelessWidget {
  final bool isInCart;
  final Map item;
  const ProductScreenButton(this.isInCart, this.item, {super.key});

  @override
  Widget build(BuildContext context) {
        Function(Map item) addToCart = context.read<CartCubit>().addCartItem;
        Function(String itemId) removeFromCart = context.read<CartCubit>().removeCartItem;
    return InkWell(
      onTap: () => isInCart ? removeFromCart(item["id"].toString()) : addToCart(item),
        child: Container(
      width: 200,
      height: 60,
      color: mainBlue,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            isInCart ? "removeFromCart".tr() : "addToCart".tr(),
            style: favoriteButtonTextStyle,
          ),
        ],
      ),
    ));
  }
}
