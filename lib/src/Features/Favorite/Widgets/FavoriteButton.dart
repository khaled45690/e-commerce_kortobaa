import 'package:ecommerce_kortobaa/Utilities/Colors.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../Utilities/Style.dart';

class FavoriteButton extends StatelessWidget {
  final String text;
  final Function() onClick;
  const FavoriteButton(this.text , this.onClick ,{super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          width: context.width() > 500? 400 : context.width() - 60,
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) , bottomRight: Radius.circular(10)),
            color: mainBlue,
          ),
          child: Center(
            child: Text(
              text,
              style: favoriteButtonTextStyle,
            ),
          )),
    );
  }
}
