import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../Utilities/Style.dart';

class ProductDetailsWidget extends StatelessWidget {
  final Map item;
  const ProductDetailsWidget(this.item , {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5 , right: 5),
          child: Text(
          item["description"],
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: favoriteDescriptionTextStyle,
        ),) ,
        Container(
          margin: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text("${item["price"]} ${"currency".tr()}", style: productPriceTextStyle),
              Row(
                children: const [
                  Text("4.6", style: productPriceTextStyle),
                  Icon(
                    color: Colors.amber,
                    Icons.star,
                    size: 25,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
