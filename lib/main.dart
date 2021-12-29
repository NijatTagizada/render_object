import 'package:flutter/material.dart';
import 'package:render_object/components/circle_progress.dart';
//import 'package:flutter/rendering.dart';
import 'package:render_object/components/custom_slider.dart';
import 'package:render_object/components/my_center.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: MyCenter(
              child: Text('d'),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              // color: Colors.cyan,
              child: ProgressBar(
                barColor: Colors.blue,
                thumbColor: Colors.red,
                thumbSize: 20.0,
              ),
            ),
          ),
          Expanded(
            child: CircleProgress(
              progress: 70,
            ),
          ),
        ],
      ),
    );
  }
}
