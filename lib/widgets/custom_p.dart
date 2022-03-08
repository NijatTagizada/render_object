import 'package:flutter/material.dart';

class CustomButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.02140745, size.height * 0.07228000);
    path_0.cubicTo(
        size.width * 0.02199867,
        size.height * 0.03809061,
        size.width * 0.03200163,
        size.height * 0.01214024,
        size.width * 0.04348949,
        size.height * 0.01499324);
    path_0.lineTo(size.width * 0.9799296, size.height * 0.2475561);
    path_0.cubicTo(
        size.width * 0.9905051,
        size.height * 0.2501821,
        size.width * 0.9986378,
        size.height * 0.2764376,
        size.width * 0.9986378,
        size.height * 0.3079515);
    path_0.lineTo(size.width * 0.9986378, size.height * 0.7310818);
    path_0.cubicTo(
        size.width * 0.9986378,
        size.height * 0.7630303,
        size.width * 0.9902867,
        size.height * 0.7894909,
        size.width * 0.9795520,
        size.height * 0.7915606);
    path_0.lineTo(size.width * 0.02859949, size.height * 0.9750606);
    path_0.cubicTo(
        size.width * 0.01641643,
        size.height * 0.9774091,
        size.width * 0.006268755,
        size.height * 0.9476818,
        size.width * 0.006894918,
        size.height * 0.9114727);
    path_0.lineTo(size.width * 0.02140745, size.height * 0.07228000);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color.fromARGB(255, 95, 130, 245).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
