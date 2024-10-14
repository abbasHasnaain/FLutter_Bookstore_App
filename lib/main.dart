import 'package:bookstore/demo.dart';
import 'package:bookstore/home.dart';
import 'package:bookstore/credentials/login.dart';
import 'package:bookstore/onboarding_screens/onboarding_splashscreen.dart';
import 'package:bookstore/signup.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';



void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(


options:
const FirebaseOptions(apiKey: "AIzaSyAYiwitnG4PGI7pJpHda_24DEyoqqdfoRw",
 appId: "1:146611402005:android:a93e53774d172e7684651c",
  messagingSenderId: "146611402005",
   projectId: "flutterprojecthome1"
   ),
);



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: 
      //  Myonboardingsplashscreen(),
      // Mypasswordresetsuccess(),
        // Myonboardingsplashscreen(),
        // Mysignup(),
        // Mylogin(),
        Myhome(),
  
      ),
    );
  }
}
