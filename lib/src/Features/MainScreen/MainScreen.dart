import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce_kortobaa/Utilities/Colors.dart';
import 'package:flutter/material.dart';
import '../../../Utilities/Style.dart';
import '../../Widgets/Loader.dart';
import 'CategoryScreen/Widgets/AppBarWidget.dart';
import 'Control/MainScreenController.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends MainScreenController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageIndex != 0 ? AppBarWidget(pageIndex) : null,
      // the widgetSelector returns widget that we need to show
      // this makes code alot cleaner
      body: isLoading ? const Loader() : widgetSelector(pageIndex),
      //
      // this is used to make the rounded button in the middle
      //
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainOrange,
        onPressed: () => pageIndexChange(4),
        child: Column(children: [
          const SizedBox(height: 6),
          SizedBox(
              height: 18,
              child:
                  Text(cartItemsNumber == 0 ? "" : cartItemsNumber.toString() , style: authButtonTextStyle,)),
          const Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 30,
          )
        ]),
        //params
      ),
      //
      // this is used to the icons on the navigation bottom
      //
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconsList,
        activeIndex: pageIndex,
        inactiveColor: Colors.grey,
        activeColor: mainBlue,
        gapLocation: GapLocation.center,
        iconSize: 35,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: pageIndexChange,
        //other params
      ),
    );
  }
}
