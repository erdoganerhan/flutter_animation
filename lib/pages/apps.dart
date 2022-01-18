import 'package:flutter/material.dart';
import 'package:flutter_animation/pages/airplane.dart';
import 'package:flutter_animation/pages/animated_container.dart';
import 'package:flutter_animation/pages/bouncing_ball.dart';

class Apps extends StatefulWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Apps'),
        ),
        body: Column(
          children: [
            ListTile(
                leading: const Icon(Icons.airplanemode_active),
                title: const Text('Airplane!'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Airplane()),
                  );
                }),
            ListTile(
                leading: const Icon(Icons.circle),
                title: const Text('Bouncing Ball'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BouncingBallDemo()),
                  );
                }),
            ListTile(
                leading: const Icon(Icons.crop_square),
                title: const Text('Container'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimatedContainerExample()),
                  );
                })
          ],
        ));
  }
}
