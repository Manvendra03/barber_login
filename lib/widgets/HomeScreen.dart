// ignore_for_file: prefer_const_constructors

import 'package:barber_app/widgets/SplashScreen.dart';
import 'package:barber_app/widgets/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          "Barber",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Center(
              child: Text(
            "Logout",
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
          )),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () async {
              showLoadingIndicator(context);
              final FirebaseAuth auth = FirebaseAuth.instance;
              //signout function

              await auth.signOut();
              Navigator.pop(context);
              if (context.mounted) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplashScreen(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width)));
              }
            },
            child: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 1,
        child: Image.asset(
          "assets/images/brbr.png",
        ),
      ),
    );
  }
}
