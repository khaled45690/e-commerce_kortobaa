import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_kortobaa/Utilities/Colors.dart';
import 'package:ecommerce_kortobaa/Utilities/Strings.dart';
import 'package:fancy_switch/fancy_switch.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        Text("homeText".tr(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        FancySwitch(
          value: context.locale == const Locale("en", ""),
          onChanged: (isEn) {
            print("hello world");
            isEn
                ? context.setLocale(const Locale("en", ""))
                : context.setLocale(const Locale("ar", ""));
          },
          height: 25,
          activeThumbColor: mainBlue,
          inactiveThumbColor: mainOrange,
          activeModeBackgroundImage: '${assetUrl}ADD.png',
          inactiveModeBackgroundImage: '${assetUrl}cmen.png',
        ),
      ],
    );
  }
}
