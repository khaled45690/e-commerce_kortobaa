import 'package:flutter/material.dart';
import 'AppBarWidget.dart';
import 'GlassifiedWidget.dart';
import 'ImageDisplayer.dart';
import 'ImageSelector.dart';
import 'SearchTextField.dart';

class HomeAppBar extends StatelessWidget {
  final String imageUrl;
  final int imageIndex;
  final Function(int imageIndex) imageSelector;
  const HomeAppBar(this.imageUrl,this.imageIndex, this.imageSelector, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: <Widget>[
          GlassifiedWidget(imageUrl),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const AppBarWidget(),
              SearchTextField((da, das) {}),
              ImageDisplayer(imageUrl , imageIndex , imageSelector),
              ImageSelector(imageIndex , imageSelector),
            ],
          )
        ],
      ),
    );
  }
}
