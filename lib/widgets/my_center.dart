import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MyCenter extends SingleChildRenderObjectWidget {
  const MyCenter({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderMyCenter();
  }
}

class _RenderMyCenter extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    if (child != null) {
      child!.layout(constraints.loosen(), parentUsesSize: true);

      size = constraints.biggest;
      var parentData = child!.parentData as BoxParentData;

      double dx = (constraints.maxWidth - child!.size.width) / 2;
      double dy = (constraints.maxHeight - child!.size.height) / 2;

      print(dx);
      print(dy);

      parentData.offset = Offset(dx, dy);
    } else {
      size = Size(0, 0);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      var parentData = child!.parentData as BoxParentData;
      print(offset.toString());
      context.paintChild(child!, offset + parentData.offset);
    }
  }
}
