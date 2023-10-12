import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "HEllo this is Homepage ",
        style: Theme.of(context).textTheme.titleLarge,
      )),
    );
  }
}
