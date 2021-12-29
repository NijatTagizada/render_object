import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircleProgress extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return ProgressRenderObject();
  }
}

class ProgressRenderObject extends RenderBox {
  @override
  void performLayout() {
    size = getDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    // These BoxContraints are passed in from the parent and tell you the max and min width and length that you’re allowed to be.
    print(constraints.toString());
    final desiredWidth = constraints.maxWidth;
    double desiredHeight = 10.0;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    canvas.translate(offset.dx, offset.dy);
    canvas.save();

    Paint line = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final gradient = SweepGradient(
      startAngle: 3 * math.pi / 2,
      endAngle: 7 * math.pi / 2,
      tileMode: TileMode.repeated,
      colors: [Colors.blue, Colors.yellow],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    double arcAngle = 2 * math.pi * (40 / 100);

    // final circlePaint = Paint()
    //   ..shader = RadialGradient(
    //     colors: [
    //       Colors.blue.shade400,
    //       Colors.yellow,
    //     ],
    //   ).createShader(Rect.fromCircle(
    //     center: (Offset(size.width / 2, (size.height / 2) + 50)),
    //     radius: arcAngle,
    //   ))
    //   ..strokeCap = StrokeCap.round
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 5;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = math.min(size.width / 2, size.height / 2) - 50;

    canvas.drawCircle(center, radius, line);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      arcAngle,
      false,
      paint,
    );

    canvas.restore();

    // final canvas = context.canvas;
    // canvas.translate(offset.dx, offset.dy);
    // canvas.save();

    // final circlePaint = Paint()
    //   ..shader = RadialGradient(
    //     colors: [
    //       Colors.blue.shade400,
    //       Colors.orange.shade300,
    //     ],
    //   ).createShader(Rect.fromCircle(
    //     center: (Offset(size.width / 2, (size.height / 2) + 50)),
    //     radius: 100,
    //   ))
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 5;

    // final arcRect = Rect.fromCircle(
    //   center: (Offset(size.width / 2, (size.height / 2) + 50)),
    //   radius: 100,
    // );

    // canvas.drawArc(arcRect, 0.0, -3.14, false, circlePaint);
    // canvas.restore();
  }
}
