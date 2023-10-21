import 'package:barber_app/auth/authservices.dart';
import 'package:barber_app/widgets/HomeScreen.dart';
import 'package:barber_app/widgets/button.dart';
import 'package:barber_app/widgets/custom_textfield.dart';
import 'package:barber_app/widgets/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
              // padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
              // margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 87, 87, 87),
                    blurRadius: 5.0,
                  )
                ],
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              height: 350,
              width: double.infinity,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Hello",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 30, color: Colors.black),
                      ),
                      Text(
                        "Sign In to your account ! ",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 19,
                            ),
                      ),
                    ],
                  ),
                  const Flexible(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  Column(
                    children: [
                      CustomTextFeild(
                        tittle: "email",
                        icon: Icons.person,
                        tx_controller: emailController,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      CustomTextFeild(
                        tittle: "password",
                        icon: Icons.key,
                        tx_controller: passwordController,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "forget password ?",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      )
                    ],
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  LoginButton(
                      tittle: "Login",
                      action: () async {
                        print("workingggg ...");
                        if (!flag) {
                          flag = true;
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            await AuthServices.signinUser(emailController.text,
                                passwordController.text, context);
                            flag = false;
                          }
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
