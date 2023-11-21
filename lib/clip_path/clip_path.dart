import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.moveTo(0, 0); // one
    path.lineTo(15, h); // two
    path.lineTo(w, h); // three
    path.lineTo(w - 15, 10); // four
    path.close(); // close

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPathSecond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.moveTo(0, 20); // one
    path.lineTo(0, h); // two
    path.lineTo(w, h); // three
    path.lineTo(w - 5, 0); // four
    path.close(); // close

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPathThird extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path(); //width: 100,
    //height: 166,

    path.moveTo(15, 20); // one
    path.lineTo(0, h); // two
    path.lineTo(w - 12, h); // three
    path.lineTo(w, 42); // four
    path.close(); // close

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
