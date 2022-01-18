import 'package:flutter/material.dart';
import 'config/navigation.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Varela",
      ),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
