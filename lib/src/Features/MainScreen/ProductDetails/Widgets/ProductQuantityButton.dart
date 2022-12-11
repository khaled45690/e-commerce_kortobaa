import 'package:ecommerce_kortobaa/StateManagement/Cart/CartData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Utilities/Colors.dart';
import '../../../../../Utilities/Style.dart';

class ProductQuantityButton extends StatelessWidget {
  final double height;
  final String itemId;
  final int itemQuantity;
  final bool isInCart;
  const ProductQuantityButton(this.height, this.itemId, this.itemQuantity,
      {super.key, this.isInCart = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: isInCart
              ? () => context.read<CartCubit>().increaseCartItem(itemId)
              : null,
          child: Container(
            width: 40,
            height: height,
            color: isInCart ? mainBlue : Colors.grey,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
        Container(
          width: 70,
          height: height,
          color: Colors.white,
          child: Center(
              child: Text(
            itemQuantity.toString(),
            style: cartExpensesPriceTextStyle,
          )),
        ),
        InkWell(
          onTap: isInCart
              ? () => context.read<CartCubit>().decreaseCartItem(itemId)
              : null,
          child: Container(
            width: 40,
            height: height,
            color: isInCart ? mainBlue : Colors.grey,
            child: const Icon(Icons.remove, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
