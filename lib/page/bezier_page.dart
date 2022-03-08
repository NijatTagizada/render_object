import 'package:flutter/material.dart';

import '../widgets/bezier_clipper.dart';

class BezierPage extends StatefulWidget {
  const BezierPage({Key? key}) : super(key: key);

  @override
  State<BezierPage> createState() => _BezierPageState();
}

class _BezierPageState extends State<BezierPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bezier Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ClipPath(
              clipper: BezierWaveClipper(),
              child: Container(
                width: 200,
                height: 200,
                color: Color.fromARGB(255, 138, 70, 70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
