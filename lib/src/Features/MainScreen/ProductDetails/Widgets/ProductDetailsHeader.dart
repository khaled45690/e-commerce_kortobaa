import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/Colors.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../StateManagement/Favorite/FavoriteData.dart';
import '../../../../../Utilities/Style.dart';

class ProductDetailsHeader extends StatelessWidget {
  final Map item;
  const ProductDetailsHeader(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isFavorite =
        context.watch<FavoriteCubit>().state[item["id"].toString()] != null;
    Function(Map item) addFavorite =
        context.read<FavoriteCubit>().addFavoriteItem;
    Function(String itemId) removeFavorite =
        context.read<FavoriteCubit>().removeFavoriteItem;
    //
    //

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.network(item["image_link"]).image, fit: BoxFit.fill),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(5, 2), // changes position of shadow
          ),
        ],
      ),
      width: context.width(),
      height: context.width(),
      child: Stack(
        children: [
          Positioned(
              top: 30,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.grey,
                ),
                onPressed: ()=>Navigator.of(context).pop(),
              )),
          Positioned(
            bottom: 0,
            child: Container(
                width: context.width(),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => isFavorite
                          ? removeFavorite(item["id"].toString())
                          : addFavorite(item),
                      child: Row(
                        children: [
                          Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            size: 30,
                            color: isFavorite ? mainOrange : Colors.black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "addedToFavorite".tr(),
                            style: isFavorite
                                ? orangeProductTextStyle
                                : productTextStyle,
                          ).tr()
                        ],
                      ),
                    ),
                    const VerticalDivider(color: Colors.grey, thickness: 1.5),
                    Row(
                      children: [
                        const Icon(
                          Icons.share_rounded,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "share".tr(),
                          style: productTextStyle,
                        ).tr()
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
