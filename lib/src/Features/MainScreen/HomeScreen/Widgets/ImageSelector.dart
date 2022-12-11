import 'package:ecommerce_kortobaa/Utilities/Colors.dart';
import 'package:flutter/material.dart';

class ImageSelector extends StatelessWidget {
  final Function(int imageIndex) imageSelector;
  final int imageIndex;
  const ImageSelector(this.imageIndex, this.imageSelector, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        InkWell(
          onTap: () => imageSelector(0),
          child: Container(
            color: imageIndex == 0 ? mainBlue : Colors.grey,
            width: 15,
            height: 5,
          ),
        ),
        InkWell(
          onTap: () => imageSelector(1),
          child: Container(
            color: imageIndex == 1 ? mainBlue : Colors.grey,
            width: 15,
            height: 5,
          ),
        ),
      ]),
    );
  }
}
