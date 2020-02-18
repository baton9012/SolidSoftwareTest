import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {// [context] будет описан позже
    return MaterialApp(
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  Random random = new Random();
  int _red = 255;
  int _blue = 255;
  int _green = 255;
  int _opaque = 255;
  int _red_negative = 0;
  int _blue_negative = 0;
  int _green_negative = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:() {
          setState(() {
            _red = random.nextInt(255);
            _blue = random.nextInt(255);
            _green = random.nextInt(255);
            _opaque = random.nextInt(255);
            _red_negative = 255 - _red;
            _blue_negative = 255 - _blue;
            _green_negative = 255 - _green;
          });
        },
        child: Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(_opaque, _red_negative, _blue_negative, _green_negative),
              ),
              child: Text(
                'Hey there',
                style: TextStyle(
                    color: Color.fromARGB(_opaque, _red, _green, _blue)
                ),
              )
            ),
          ),
          backgroundColor: Color.fromARGB(_opaque, _red, _green, _blue),
        ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}