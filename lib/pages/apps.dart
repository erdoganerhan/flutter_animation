import 'package:flutter/material.dart';
import 'package:flutter_animation/pages/airplane.dart';

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
                title: const Text('Airplane'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Airplane()),
                  );
                })
          ],
        ));
  }
}
