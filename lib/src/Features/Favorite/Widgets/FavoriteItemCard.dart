import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/StateManagement/Favorite/FavoriteData.dart';
import 'package:ecommerce_kortobaa/Utilities/Colors.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../StateManagement/Cart/CartData.dart';
import '../../../../Utilities/Strings.dart';
import '../../../../Utilities/Style.dart';
import 'FavoriteButton.dart';

class FavoriteItemCard extends StatelessWidget {
  final Map item;
  const FavoriteItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isInCart =
        context.watch<CartCubit>().state[item["id"].toString()] != null;
    //
    //
    //
    String buttonText = isInCart ? "removeFromCart".tr() : "moveToCart".tr();

    buttonFunction() => isInCart
        ? context.read<CartCubit>().removeCartItem(item["id"].toString())
        : context.read<CartCubit>().addCartItem(item);

    removeFavoriteFunction() =>
        context.read<FavoriteCubit>().removeFavoriteItem(item["id"].toString());

    return Stack(
      children: [
        ClipRRect(
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: const EdgeInsets.only(top: 10),
              width: context.width() > 500 ? 460 : context.width() - 30,
              height: context.height() - context.height() / 3.2,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        item["image_link"],
                        fit: BoxFit.fill,
                        width: context.width(),
                        height: context.height() - context.height() / 1.7,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 100,
                        margin: const EdgeInsets.all(8),
                        child: Text(
                          item["description"],
                          style: favoriteDescriptionTextStyle,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Text("${item["price"]} ${"currency".tr()}",
                            style: favoritePriceTextStyle),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: removeFavoriteFunction,
                      child: const Icon(
                        Icons.favorite,
                        size: 35,
                        color: mainOrange,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: FavoriteButton(buttonText, buttonFunction),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
