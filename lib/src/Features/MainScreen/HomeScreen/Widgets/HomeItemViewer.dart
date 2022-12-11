import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../Utilities/Style.dart';
import 'HomeItemCard.dart';

class HomeItemViewer extends StatelessWidget {
  final double height = 260;
  final String text;
  final List items;
  const HomeItemViewer(this.text, this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: Text(
              text,
              style: itemViewerUpperTextStyle,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Text("${"viewAll".tr()}", style: itemViewerUpperTextStyle),
          ),
        ],
      ),
      SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext contexts, int index) {
            return HomeItemCard(items[index], height);
          },
        ),
      ),
    ]);
  }
}
