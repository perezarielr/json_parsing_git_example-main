import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _widht = 70.0;
  double _height = 70.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(30.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Conatiner"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.fastOutSlowIn,
          width: _widht,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma() {

    final random = Random();


  setState(() {
    
  _widht = random.nextInt(300).toDouble();
  _height = random.nextInt(300).toDouble();
  _color = Color.fromRGBO(
    random.nextInt(255),
     random.nextInt(255),
      random.nextInt(255),
       1);

  });
  }
}