import 'package:flutter/material.dart';

import '../../../../../Utilities/Style.dart';

class HomeScreenCategoriesWidget extends StatelessWidget {
  final List categories;
  const HomeScreenCategoriesWidget(this.categories, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            margin: const EdgeInsets.only(left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: Image.network(categories[index]["image_link"]).image , fit: BoxFit.fill),
                      borderRadius:const  BorderRadius.all(Radius.circular(70))),
                  width: 90,
                  height:90,
                ),
                const SizedBox(
                  height: 5,
                ),
                 Center(child: Text(categories[index]["name"].toString() , style: cartPartTwoTextStyle,) ),
              ],
            ),
          );
        },
      ),
    );
  }
}
