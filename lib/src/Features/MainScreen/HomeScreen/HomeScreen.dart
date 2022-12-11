import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../Utilities/Strings.dart';
import 'Widgets/HomeScreenCategoriesWidget.dart';
import 'Widgets/HomeAppBar.dart';
import 'Widgets/HomeItemViewer.dart';

class HomeScreen extends StatefulWidget {
  final List categories, latestProducts, mostPopularProducts;
  const HomeScreen(
      this.categories, this.latestProducts, this.mostPopularProducts,
      {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl = "${assetUrl}cmen.png";
  int imageIndex = 0;
  String mostPopular = "mostPopular".tr();
  String mostRecent = "mostRecent".tr();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mostPopular = "mostPopular".tr();
    mostRecent = "mostRecent".tr();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // mostPopular = context.locale == Locale("en", "") ?  "mostPopular".tr() : "mostPopular".tr() ;
    setState(() {});
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeAppBar(imageUrl, imageIndex, imageSelector),
          HomeScreenCategoriesWidget(widget.categories),
          HomeItemViewer(mostRecent, widget.latestProducts),
          const SizedBox(
            height: 40,
          ),
          HomeItemViewer(mostPopular, widget.mostPopularProducts),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  imageSelector(int index) {
    setState(() {
      imageIndex = index;
      if (index == 0) {
        imageUrl = "${assetUrl}cmen.png";
        return;
      }
      imageUrl = "${assetUrl}ADD.png";
    });
  }
}
