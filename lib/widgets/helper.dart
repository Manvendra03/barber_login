import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showLoadingIndicator(context) {
  showDialog(
      context: context,
      builder: ((context) => Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 110, 23, 17),
            ),
          )));
}
