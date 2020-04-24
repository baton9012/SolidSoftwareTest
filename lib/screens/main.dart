import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomColors(),
    );
  }
}

class RandomColorState extends State<RandomColors> {
  RandomColor _randomColor = RandomColor();
  Color _color;
  MyColor _myColor;

  @override
  void initState() {
    _color = _randomColor.randomColor();
    _myColor = getColorNameFromColor(_color);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Container(
          color: _color,
          child: Center(
            child: Text(
              'Hey there ${_myColor.getName.toLowerCase()} color',
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _color = _randomColor.randomColor();
          _myColor = getColorNameFromColor(_color);
        });
      },
    );
  }
}

class RandomColors extends StatefulWidget {
  @override
  RandomColorState createState() => RandomColorState();
}
