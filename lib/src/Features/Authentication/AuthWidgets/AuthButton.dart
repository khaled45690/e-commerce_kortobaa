import 'package:ecommerce_kortobaa/Utilities/Colors.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../Utilities/Strings.dart';
import '../../../../Utilities/Style.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onClick;
  final bool isLoading;

   const AuthButton(this.text, this.onClick, this.isLoading, {super.key});

  @override
  Widget build(BuildContext context) {
      double width = isLoading ? 100 : 0;
    return InkWell(
      onTap: isLoading ? null : onClick,
      child: AnimatedContainer(
        duration: Duration(milliseconds:500),
          width: context.width() > 500 ? 400 : context.width() - 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: isLoading ? Colors.grey : mainBlue,
          ),
          child: Row(
            mainAxisAlignment: isLoading ? MainAxisAlignment.spaceAround : MainAxisAlignment.center,
            children: [
            Text(
                text,
                style: authButtonTextStyle,
              ),
              isLoading ? Image.asset("${assetUrl}loading.gif" , fit: BoxFit.fitHeight, width:30,): const SizedBox()
          ])),
    );
  }
}
