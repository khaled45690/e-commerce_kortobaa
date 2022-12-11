import 'package:ecommerce_kortobaa/Utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class GlassifiedWidget extends StatelessWidget {
  final String imageUrl;
  const GlassifiedWidget(this.imageUrl,{super.key});
// "${assetUrl}cmen.png"
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            ClipRRect(
              child: Container(
                width: context.width(),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset(imageUrl).image,
                      opacity: 0.9,
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Container(
              color: const ui.Color.fromARGB(211, 236, 236, 243),
              width: context.width(),
              height: 100,
            )
          ],
        ),
        Column(
          children: [
            ClipRRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                  ),
                  width: context.width(),
                  height: 240,
                ),
              ),
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(251, 237, 237, 250).withOpacity(1),
                  ),
                  width: context.width(),
                  height: 50,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
