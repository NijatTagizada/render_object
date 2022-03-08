import 'package:flutter/material.dart';

class BezierWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 301.691;
    path.lineTo(-0.003 * _xScaling, 217.841 * _yScaling);
    path.cubicTo(
      -0.003 * _xScaling,
      217.841 * _yScaling,
      19.14 * _xScaling,
      265.91 * _yScaling,
      67.233 * _xScaling,
      265.9 * _yScaling,
    );
    path.cubicTo(
      115.326 * _xScaling,
      265.9 * _yScaling,
      112.752 * _xScaling,
      234.611 * _yScaling,
      173.8 * _xScaling,
      241.635 * _yScaling,
    );
    path.cubicTo(
      234.914 * _xScaling,
      248.659 * _yScaling,
      272.866 * _xScaling,
      301.691 * _yScaling,
      328.608 * _xScaling,
      301.691 * _yScaling,
    );
    path.cubicTo(
      384.34 * _xScaling,
      301.691 * _yScaling,
      413.9 * _xScaling,
      201.977 * _yScaling,
      413.9 * _xScaling,
      201.977 * _yScaling,
    );
    path.cubicTo(
      413.99 * _xScaling,
      201.977 * _yScaling,
      413.99 * _xScaling,
      0 * _yScaling,
      413.996 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      413.996 * _xScaling,
      0 * _yScaling,
      -0.00399 * _xScaling,
      0 * _yScaling,
      -0.00399 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      -0.00399 * _xScaling,
      0 * _yScaling,
      -0.00399 * _xScaling,
      217.841 * _yScaling,
      -0.00399 * _xScaling,
      217.841 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
