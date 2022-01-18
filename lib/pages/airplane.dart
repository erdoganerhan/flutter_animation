import 'package:flutter/material.dart';

class Airplane extends StatefulWidget {
  const Airplane({Key? key}) : super(key: key);

  @override
  _AirplaneState createState() => _AirplaneState();
}

class _AirplaneState extends State<Airplane>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // #docregion addListener
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        // #enddocregion addListener
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
        // #docregion addListener
      });
    // #enddocregion addListener
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Airplane')),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Icon(Icons.airplanemode_active, size: animation.value),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
