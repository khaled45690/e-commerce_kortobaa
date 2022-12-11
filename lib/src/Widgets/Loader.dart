import 'package:ecommerce_kortobaa/Utilities/Strings.dart';
import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Image.asset("${assetUrl}loading.gif" , width: context.width(),),
    );
  }
}