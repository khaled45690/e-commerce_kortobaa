import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../StateManagement/Cart/CartData.dart';
import 'Widgets/PriceTag.dart';
import 'Widgets/ProductDescription.dart';
import 'Widgets/ProductDetailsHeader.dart';
import 'Widgets/ProductDetailsWidget.dart';
import 'Widgets/ProductQuantityButton.dart';
import 'Widgets/ProductScreenButton.dart';

class ProductDetails extends StatelessWidget {
  final Map item;
  const ProductDetails(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isInCart =
        context.watch<CartCubit>().state[item["id"].toString()] != null;
    int itemQuantity = isInCart?
        context.watch<CartCubit>().state[item["id"].toString()]["quantity"] : 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailsHeader(item),
            const SizedBox(
              height: 20,
            ),
            ProductDetailsWidget(item),
            const Divider(thickness: 1),
            const ProductDescription(),
            const Divider(thickness: 1.5),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductQuantityButton(50, item["id"].toString(), itemQuantity , isInCart: isInCart),
                  PriceTag((itemQuantity *  double.parse(item["price"]) )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ProductScreenButton(isInCart , item),
          ],
        ),
      ),
    );
  }
}
