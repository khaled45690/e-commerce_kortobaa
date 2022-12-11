import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'Widgets/CategoryCard.dart';

class CategoryScreen extends StatelessWidget {
  final List categories;
  const CategoryScreen(this.categories , {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: context.width() > 500 ? 460 : context.width() - 60,
          height: context.height(),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext contexts, int index) {
              return CategoryCard(categories[index]);
            },
          ),
        ),
      ),
    );
  }
}
