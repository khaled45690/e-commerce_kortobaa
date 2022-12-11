import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../Utilities/Style.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final int pageIndex;
  const AppBarWidget(this.pageIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      flexibleSpace: Container(
          margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.menu_rounded,
                  color: Colors.grey,
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ])),
      backgroundColor: Colors.white,
      title: Text(pageTitle(pageIndex)),
      titleTextStyle: cartExpensesPriceTextStyle,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(60);

  String pageTitle(int pageindex) {
    switch (pageindex) {
      case 1 : return "categories".tr(); 
      case 2 : return "favorite".tr(); 
      case 4 : return "cart".tr(); 
      default:
        return "";
    }
  }
}
