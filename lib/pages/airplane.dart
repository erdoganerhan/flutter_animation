import 'package:flutter/material.dart';

class Airplane extends StatefulWidget {
  const Airplane({Key? key}) : super(key: key);

  @override
  _AirplaneState createState() => _AirplaneState();
}

// #docregion print-state
class _AirplaneState extends State<Airplane>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      // #enddocregion print-state
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      // #docregion print-state
      ..addStatusListener((state) => print('$state'));
    controller.forward();
  }
  // #enddocregion print-state

  @override
  Widget build(BuildContext context) => AnimatedIcon(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  // #docregion print-state
}

class AnimatedIcon extends AnimatedWidget {
  const AnimatedIcon({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Airplane!'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Icon(Icons.airplanemode_active, size: animation.value),
        ),
      ),
    );
  }
}
