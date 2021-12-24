import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';

class ProgressBar extends LeafRenderObjectWidget {
  const ProgressBar({
    Key? key,
    required this.barColor,
    required this.thumbColor,
    this.thumbSize = 20.0,
  }) : super(key: key);

  final Color barColor;
  final Color thumbColor;
  final double thumbSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderProgressBar(
      barColor: barColor,
      thumbColor: thumbColor,
      thumbSize: thumbSize,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderProgressBar renderObject) {
    renderObject
      ..barColor = barColor
      ..thumbColor = thumbColor
      ..thumbSize = thumbSize;
  }
}

class RenderProgressBar extends RenderBox {
  Color get barColor => _barColor;
  Color _barColor;
  set barColor(Color value) {
    if (_barColor == value) return;
    _barColor = value;
    markNeedsPaint();
  }

  Color get thumbColor => _thumbColor;
  Color _thumbColor;
  set thumbColor(Color value) {
    if (_thumbColor == value) return;
    _thumbColor = value;
    markNeedsPaint();
  }

  double get thumbSize => _thumbSize;
  double _thumbSize;
  set thumbSize(double value) {
    if (_thumbSize == value) return;
    _thumbSize = value;
    markNeedsLayout();
  }

  static const _minDesiredWidth = 100.0;
  late HorizontalDragGestureRecognizer _drag;

  RenderProgressBar({
    required Color barColor,
    required Color thumbColor,
    required double thumbSize,
  })  : _barColor = barColor,
        _thumbColor = thumbColor,
        _thumbSize = thumbSize {
    // initialize the gesture recognizer
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = (DragStartDetails details) {
        _updateThumbPosition(details.localPosition);
      }
      ..onUpdate = (DragUpdateDetails details) {
        _updateThumbPosition(details.localPosition);
      };
  }

  @override
  void performLayout() {
    size = getDryLayout(constraints);
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    // These BoxContraints are passed in from the parent and tell you the max and min width and length that you’re allowed to be.
    print(constraints.toString());
    final desiredWidth = constraints.maxWidth;
    final desiredHeight = thumbSize;
    final desiredSize = Size(desiredWidth, desiredHeight);
    return constraints.constrain(desiredSize);
  }

  @override
  double computeMinIntrinsicWidth(double height) => _minDesiredWidth;

  @override
  double computeMaxIntrinsicWidth(double height) => _minDesiredWidth;

  @override
  double computeMinIntrinsicHeight(double width) => thumbSize;

  @override
  double computeMaxIntrinsicHeight(double width) => thumbSize;

  // To limit repainting to just our widget
  // Only the progress bar widget is getting repainted. The parent widget tree isn’t.
  // Flutter makes a new painting layer that is separate from the rest of the tree.
  // Doing so takes more memory resources.
  // If the widget repaints a lot then that’s probably a good use of resources.
  // But if it doesn’t then you’re wasting memory.
  @override
  bool get isRepaintBoundary => true;

  double _currentThumbValue = 0.5;

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent) {
      _drag.addPointer(event);
    }
  }

  void _updateThumbPosition(Offset localPosition) {
    // This can go out of bounds so you clamp it between zero and the width of the widget.
    var dx = localPosition.dx.clamp(0, size.width);
    _currentThumbValue = dx / size.width;

    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    // paint bar
    final barPaint = Paint()
      ..color = barColor
      ..strokeWidth = 5;
    final pointStart = Offset(0, size.height / 2);
    final pointEnd = Offset(size.width, size.height / 2);
    canvas.drawLine(pointStart, pointEnd, barPaint);

    // paint thumb
    final thumbPaint = Paint()..color = thumbColor;
    final thumbDx = _currentThumbValue * size.width;
    final position = Offset(thumbDx, size.height / 2);
    canvas.drawCircle(position, thumbSize / 2, thumbPaint);
    canvas.restore();
  }

  //For visually impaired people (Screen Reader)
  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);

    // description
    config.textDirection = TextDirection.ltr;
    config.label = 'Progress bar';
    config.value = '${(_currentThumbValue * 100).round()}%';

    // increase action
    config.onIncrease = increaseAction;
    final increased = _currentThumbValue + _semanticActionUnit;
    config.increasedValue = '${((increased).clamp(0.0, 1.0) * 100).round()}%';

    // descrease action
    config.onDecrease = decreaseAction;
    final decreased = _currentThumbValue - _semanticActionUnit;
    config.decreasedValue = '${((decreased).clamp(0.0, 1.0) * 100).round()}%';
  }

  static const double _semanticActionUnit = 0.05;

  void increaseAction() {
    final newValue = _currentThumbValue + _semanticActionUnit;
    _currentThumbValue = (newValue).clamp(0.0, 1.0);
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  void decreaseAction() {
    final newValue = _currentThumbValue - _semanticActionUnit;
    _currentThumbValue = (newValue).clamp(0.0, 1.0);
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }
}
