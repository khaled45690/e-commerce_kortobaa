// Text Style

import 'package:flutter/material.dart';

import 'Colors.dart';

// Text Style
const textfieldHintStyle = TextStyle(
  color: Colors.grey,
);

const TextStyle authTitleStyle =
    TextStyle(color: mainOrange, fontSize: 25, fontWeight: FontWeight.bold);
const TextStyle authDescriptionStyle =
    TextStyle(fontSize: 17, fontWeight: FontWeight.w600, letterSpacing: 1);
const TextStyle textFieldUpperTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 1);

const TextStyle authsecondPartTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: mainOrange,
    decoration: TextDecoration.underline,
    decorationThickness: 25,
    decorationColor: mainOrange);
const TextStyle authButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5);

const TextStyle itemViewerUpperTextStyle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0);
const TextStyle itemViewerDescriptionTextStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.6);
const TextStyle itemViewerPriceTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
    color: mainBlue);
const TextStyle categoryTextStyle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    color: Colors.white);
const TextStyle favoriteDescriptionTextStyle =
    TextStyle(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0);
const TextStyle favoritePriceTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: mainBlue);

const TextStyle favoriteButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4);

const TextStyle productTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4);

    const TextStyle orangeProductTextStyle = TextStyle(
    color: mainOrange,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4);

const TextStyle productPriceTextStyle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
    color: mainBlue);

const TextStyle cartPartTwoTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4);

const TextStyle cartPartOneTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: mainBlue);

    const TextStyle couponTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3);

    const couponTextfieldHintStyle = TextStyle(
  color: Colors.black,
  fontSize: 14
);


const TextStyle cartExpensesPriceTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4);
// Decoration Style

 BoxDecoration cartWidgetDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 6,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],
  borderRadius: BorderRadius.circular(10),
  color: Colors.white,
);
