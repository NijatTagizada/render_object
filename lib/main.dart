import 'package:flutter/material.dart';

import 'page/bezier_page.dart';
import 'page/index_page.dart';

void main() {
  //debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Widgets'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              MaterialButton(
                color: Colors.amber,
                child: Text('Index Page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IndexPage()),
                  );
                },
              ),
              SizedBox(height: 10),
              MaterialButton(
                color: Colors.amber,
                child: Text('Bezier Page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BezierPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
