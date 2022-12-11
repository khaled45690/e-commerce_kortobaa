import 'package:ecommerce_kortobaa/StateManagement/Favorite/FavoriteData.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Widgets/FavoriteItemCard.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    List itemslist = mapToList(context.watch<FavoriteCubit>().state);
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: context.width() > 500 ? 460 : context.width() - 60,
          height: context.height(),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: itemslist.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext contexts, int index) {
              return FavoriteItemCard(itemslist[index]);
            },
          ),
        ),
      ),
    );
  }

  
}

List mapToList(Map items) {
  List itemsList = [];
  items.forEach((key, value) {
    if (value is Map) itemsList.add(value);
  });

  return itemsList;
}