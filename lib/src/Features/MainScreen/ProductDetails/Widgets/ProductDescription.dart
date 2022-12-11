import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../Utilities/Style.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return           Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("description".tr(), style: productPriceTextStyle),
                const Icon(
                  color: Colors.grey,
                  Icons.arrow_drop_down,
                  size: 30,
                )
              ],
            ),
          );
  }
}