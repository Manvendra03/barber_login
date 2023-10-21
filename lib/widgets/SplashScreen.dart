import 'package:barber_app/auth/authservices.dart';
import 'package:barber_app/utils/constants.dart';
import 'package:barber_app/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:slider_button/slider_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          SizedBox(
              height: height * .4,
              width: double.infinity,
              child: Image.asset(
                'assets/images/small.png',
                fit: BoxFit.fitHeight,
              )),
          SizedBox(
            height: height * .39,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to Barber.com",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(letterSpacing: 2),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        login_description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginButton(
                      tittle: "Login",
                      action: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                    LoginButton(
                        tittle: "Sign Up",
                        action: () {
                          Navigator.pushNamed(context, '/register');
                        })
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: width * .8,
                  child: SliderButton(
                      action: () async {
                        AuthServices.signinWithGoogle(context);
                      },
                      alignLabel: Alignment.center,
                      shimmer: false,
                      label: Text(
                        "Login with google",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 16, color: Colors.black),
                      ),
                      radius: 30,
                      icon: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/images/google.png",
                            fit: BoxFit.cover,
                          ))),
                )
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
