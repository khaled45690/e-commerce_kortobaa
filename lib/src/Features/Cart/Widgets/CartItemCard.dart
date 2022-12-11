import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/StateManagement/Cart/CartData.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Utilities/Colors.dart';
import '../../../../Utilities/Style.dart';
import '../../MainScreen/ProductDetails/Widgets/ProductQuantityButton.dart';

class CartItemCard extends StatelessWidget {
  final Map item;
  const CartItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cartWidgetDecoration,
      margin: const EdgeInsets.only(top: 10),
      width: context.width() - 50,
      height: context.height() / 5,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: context.height() / 6.3,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: context.locale == const Locale('en', '')
                        ? const BorderRadius.only(topLeft: Radius.circular(10))
                        : const BorderRadius.only(
                            topRight: Radius.circular(10)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Image.network(
                          item["data"]["image_link"],
                        ).image)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: context.height() / 6.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width() - 230,
                      child: Text(
                        item["data"]["description"],
                        style: cartPartTwoTextStyle,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${item["data"]["price"]} ${"currency".tr()}",
                      style: cartPartOneTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
          Row(
            children: [
              ProductQuantityButton(context.height() / 24.5 , item["data"]["id"].toString() ,  item["quantity"]),
              //
              //
              //
              //
              SizedBox(
                  width: context.width() - 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                            child: Text(
                                "${(double.parse(item["data"]["price"]) * item["quantity"])}",
                                style: cartPartTwoTextStyle)),
                      ),
                      //
                      //
                      //
                      //
                      Container(
                        decoration: BoxDecoration(
                          color: mainOrange,
                          borderRadius: context.locale == const Locale('en', '')
                              ? const BorderRadius.only(
                                  bottomRight: Radius.circular(10))
                              : const BorderRadius.only(
                                  bottomLeft: Radius.circular(10)),
                        ),
                        width: 35,
                        height: context.height() / 24.4,
                        child: Center(
                            child: IconButton(
                                onPressed: () => context
                                    .read<CartCubit>()
                                    .removeCartItem(
                                        item["data"]["id"].toString()),
                                icon: const Icon(Icons.delete_forever),
                                color: Colors.white,
                                iconSize: 20)),
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
