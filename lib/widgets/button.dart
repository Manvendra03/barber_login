import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String tittle;
  final Function action;

  const LoginButton({
    super.key,
    required this.tittle,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your on pressed event here
        action();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 40),
        maximumSize: const Size(170, 48),
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
        child: Text(
          tittle,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
