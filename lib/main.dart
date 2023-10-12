import 'package:barber_app/widgets/HomeScreen.dart';
import 'package:barber_app/widgets/RegisterScreen.dart';
import 'package:barber_app/widgets/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barber_app/widgets/LoginScreen.dart';

void main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    final double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffE29452),
        ),

        textTheme: TextTheme(
            bodySmall: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
            ),
            titleLarge: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.bold)),
        // scaffoldBackgroundColor: Color.fromARGB(255, 255, 106, 0),
        scaffoldBackgroundColor: const Color.fromARGB(255, 231, 206, 164),
        primaryColor: const Color.fromARGB(255, 110, 23, 17),
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => SplashScreen(height: height, width: width),
        '/home': (context) => const HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
