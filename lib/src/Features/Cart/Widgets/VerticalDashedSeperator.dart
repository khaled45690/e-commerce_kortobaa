import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerticalDashedSeperator extends StatelessWidget {
  final double height;
  const VerticalDashedSeperator(
      {required this.height,  super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (_) {
        return SizedBox(
          width: 4,
          height: height / 6,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.white),
          ),
        );
      }),
    );
  }
}
