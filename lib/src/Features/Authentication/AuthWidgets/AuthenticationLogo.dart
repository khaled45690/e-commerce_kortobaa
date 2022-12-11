import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../Utilities/Strings.dart';

class AuthenticationLogo extends StatelessWidget {
  final String imagePath;
  final double marginTop;
  const AuthenticationLogo(this.imagePath , this.marginTop ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.width() / 2.5,
        margin: EdgeInsets.only(top: marginTop),
        child: Image.asset(
          "$assetUrl$imagePath",
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

