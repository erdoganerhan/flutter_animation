import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key? key}) : super(key: key);

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 180).animate(controller)
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

  @override
  Widget build(BuildContext context) {
    return AnimatedContainerDemo(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

double randomMargin(double value) {
  return value * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends AnimatedWidget {
  AnimatedContainerDemo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: Container(
                decoration: BoxDecoration(
                  color: randomColor(),
                  borderRadius: BorderRadius.circular(animation.value),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
