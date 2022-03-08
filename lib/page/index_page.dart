import 'package:flutter/material.dart';

import '../widgets/center_widget.dart';
import '../widgets/circle_progress.dart';
import '../widgets/custom_slider.dart';

class IndexPage extends StatefulWidget {
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  double progress = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CenterWidget(
              child: Text('Centered Text'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    if (progress < 100) {
                      progress += 10;
                    }
                  });
                },
                child: Text('Increase'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (progress != 0) {
                      progress -= 10;
                    }
                  });
                },
                child: Text('Decrease'),
              ),
            ],
          ),
          Expanded(
            child: CircleProgress(
              progress: progress,
              bgColor: Colors.grey.shade400,
              progressColor: [
                Colors.blue,
                Colors.green,
                Colors.amber,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
