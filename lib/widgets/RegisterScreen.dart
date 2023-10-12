import 'package:barber_app/widgets/button.dart';
import 'package:barber_app/widgets/custom_textfield.dart';
import 'package:barber_app/widgets/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Container(
          padding:
              const EdgeInsets.only(bottom: 20, left: 15, right: 15, top: 5),
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 87, 87, 87),
                blurRadius: 5.0,
              )
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Create account",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      letterSpacing: 2,
                      fontSize: 27,
                    ),
              ),
              // const SizedBox(
              //   height: 2,
              // ),
              CustomTextFeild(
                tittle: "username",
                icon: Icons.person,
                tx_controller: usernameController,
              ),
              CustomTextFeild(
                tittle: "password",
                icon: Icons.key,
                tx_controller: passwordController,
              ),
              CustomTextFeild(
                tittle: "email",
                icon: Icons.mail,
                tx_controller: emailController,
              ),
              CustomTextFeild(
                tittle: "phone number",
                icon: Icons.phone,
                tx_controller: phonenumberController,
              ),
              const SizedBox(
                height: 5,
              ),
              LoginButton(
                  tittle: "Register",
                  action: () async {
                    String emailAddress = emailController.text;
                    String password = passwordController.text;
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailAddress,
                        password: password,
                      );

                      showToast("Account Created ... ");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        showToast("Week-Password");
                      } else if (e.code == 'email-already-in-use') {
                        showToast("user already exist");
                      }
                    } catch (e) {
                      showToast("Something Went Wrong...");
                    }
                  })
            ],
          ),
        )),
      ),
    );
  }
}
