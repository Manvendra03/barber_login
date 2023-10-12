import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    required this.tittle,
    required this.icon,
    required this.tx_controller,
    super.key,
  });

  final String tittle;
  final IconData icon;
  // ignore: non_constant_identifier_names
  final TextEditingController tx_controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tx_controller,
      obscureText: tittle == 'password',
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusColor: Colors.black,
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: tittle,
      ),
    );
  }
}
