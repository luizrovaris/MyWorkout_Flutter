import 'package:flutter/material.dart';

class WorkoutScreenCustomClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width * 0.5, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }

}