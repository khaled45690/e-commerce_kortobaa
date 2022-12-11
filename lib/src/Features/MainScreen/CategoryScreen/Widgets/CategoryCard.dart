import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../Utilities/Style.dart';

class CategoryCard extends StatelessWidget {
  final Map category;
  const CategoryCard(this.category , {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: context.width() > 500 ? 460 : context.width() - 250,
      decoration:  BoxDecoration(
                              image: DecorationImage(image: Image.network(category["image_link"]).image , fit: BoxFit.fill),
          color: Colors.amber,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
          child: Text(
        category["name"].toString(),
        style: categoryTextStyle,
      )),
    );
  }
}
