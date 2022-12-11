import 'dart:convert';

import 'package:ecommerce_kortobaa/StateManagement/Cart/CartData.dart';
import 'package:ecommerce_kortobaa/StateManagement/UserData/UserData.dart';
import 'package:ecommerce_kortobaa/Utilities/GlobalController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../../../Utilities/Strings.dart';
import '../../Cart/Cart.dart';
import '../../Favorite/FavoriteScreen.dart';
import '../CategoryScreen/CategoryScreen.dart';
import '../HomeScreen/HomeScreen.dart';
import '../MainScreen.dart';

abstract class MainScreenController extends State<MainScreen>
    with GlobalController {
  List<IconData> iconsList = [
    Icons.home_rounded,
    Icons.developer_board_outlined,
    Icons.favorite,
    Icons.person
  ];
  int cartItemsNumber = 0;
  bool isLoading = true;
  int pageIndex = 0;
  int numOfRequests = 0;
  List categories = [];
  List latestProducts = [];
  List mostPopularProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCategories();
    _getProductsByCategoryId(1).then(_getLatestItems);
    _getProductsByCategoryId(5).then(_getMostPopularItems);
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    cartItemsNumber = context.watch<CartCubit>().state["totalItems"];
  }

  pageIndexChange(int index) {
    if (index != 3) pageIndex = index;
    setState(() {});
  }

  Widget widgetSelector(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return HomeScreen(categories, latestProducts, mostPopularProducts);
      case 1:
        return CategoryScreen(categories);
      case 2:
        return const FavoriteScreen();
      case 4:
        return Cart();
      default:
        return Container();
    }
  }

  Future _getCategories() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "JWT ${context.read<UserCubit>().state!["access"]}"
    };
    Response response = await HttpGet(getCategoriesAPI, header: headers);
    categories = jsonDecode(response.body)["results"];
    numOfRequests++;
    if (numOfRequests == 3) isLoading = false;
    setState(() {});
  }

  _getLatestItems(List latestProducts) {
    this.latestProducts = latestProducts;
    numOfRequests++;
    if (numOfRequests == 3) isLoading = false;
    setState(() {});
  }

  _getMostPopularItems(List mostPopularProducts) {
    this.mostPopularProducts = mostPopularProducts;
    numOfRequests++;
    if (numOfRequests == 3) isLoading = false;
    setState(() {});
  }

  Future<List> _getProductsByCategoryId(int categoryId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "JWT ${context.read<UserCubit>().state!["access"]}"
    };
    Response response = await HttpGet("$getProductsByCategoryIdAPI$categoryId",
        header: headers);

    return jsonDecode(response.body)["results"];
  }
}
