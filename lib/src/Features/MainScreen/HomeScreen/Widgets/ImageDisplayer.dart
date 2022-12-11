import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../Utilities/Strings.dart';

class ImageDisplayer extends StatelessWidget {
  final String imageUrl;
  final Function(int imageIndex) imageSelector;
  final int imageIndex;
  const ImageDisplayer(this.imageUrl, this.imageIndex, this.imageSelector,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => imageSelector(imageIndex == 0? 1:0),
      child: Container(
        width: context.width() - 50,
        height: context.height() / 5,
        decoration: BoxDecoration(
          image: DecorationImage(
           
              image: Image.asset(imageUrl).image, fit: BoxFit.fitWidth),
        ), 
      ),
    );
  }
}
