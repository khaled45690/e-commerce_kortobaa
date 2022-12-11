import 'package:flutter/material.dart';

class TicketClipperEN extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    double x = size.height / 10;

    path.lineTo(0.0, 0);
    path.lineTo(0, size.height);
    for (int i = 0; i < 10; i = i + 2) {
      path.lineTo(size.width, size.height - x * i);
      path.lineTo(size.width - size.width / 25, size.height - x * (i + 1));
    }
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TicketClipperAR extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    double x = size.height / 10;

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    for (int i = 0; i < 10; i = i + 2) {
      path.lineTo(0, size.height - x * i);
      path.lineTo(size.width / 25, size.height - x * (i + 1));
    }
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
