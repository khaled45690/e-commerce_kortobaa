import 'package:ecommerce_kortobaa/StateManagement/Favorite/FavoriteData.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../StateManagement/Cart/CartData.dart';
import '../../../../../Utilities/Style.dart';
import '../../ProductDetails/ProductDetails.dart';

class HomeItemCard extends StatelessWidget {
  final double height;
  final Map item;
  const HomeItemCard(this.item, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isFavorite = context.watch<FavoriteCubit>().state[item["id"].toString()] != null;
    Function(Map item) addFavorite =
        context.read<FavoriteCubit>().addFavoriteItem;
    Function(String itemId) removeFavorite =
        context.read<FavoriteCubit>().removeFavoriteItem;
    bool isInCart = context.watch<CartCubit>().state[item["id"].toString()] != null;
        Function(Map item) addToCart =
        context.read<CartCubit>().addCartItem;
    Function(String itemId) removeToCart =
        context.read<CartCubit>().removeCartItem;



    return Stack(
      children: [
        InkWell(
          onTap: () => context.navigateTo(ProductDetails(item)),
          child: Container(
          margin: const EdgeInsets.only(left: 4, right: 4),
          color: Colors.white,
          width: 170,
          height: height,
          child: Column(children: [
            Image.network(
              item["image_link"],
              height: 130,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                item["description"],
                maxLines: 2,
                style: itemViewerDescriptionTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("${item["price"]} ج.م", style: itemViewerPriceTextStyle),
                IconButton(
                  onPressed:() =>  isInCart ? removeToCart(item["id"].toString()) : addToCart(item),
                  icon: Icon(
                    isInCart ? Icons.remove_shopping_cart_outlined:Icons.add_shopping_cart,
                    size: 25,
                  ),
                ),
              ],
            )
          ]),
        ),),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            onPressed: () =>
                isFavorite ?removeFavorite(item["id"].toString())  : addFavorite(item),
            icon: Icon(
              isFavorite ? Icons.favorite :  Icons.favorite_border_outlined,
              size: 25,
              color: isFavorite ? Colors.red  :Colors.grey ,
            ),
          ),
        )
      ],
    );
  }
}
