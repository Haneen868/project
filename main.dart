import 'package:flutter/material.dart';
import 'package:traffic_sign/Screen/auth.dart';
import 'package:traffic_sign/Screen/homeScreen.dart';
import 'package:traffic_sign/Screen/login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:traffic_sign/Screen/signup_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyATM03xEFQRsGoc5fEEq2ciyDC1SWLWMjo",
          appId: "1:830665493980:android:c4908a19a25aacb0d3d319",
          messagingSenderId: "830665493980",
          projectId: "driver-sence-63ac7"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const auth(),
      routes: {
        //'/': (context) => const auth(),
        'loginScreen': (context) => const loginScreen(),
        'SignUpScreen': (context) => const signup(),
        'homeScreen': (context) => const homeScreen(),
      },
    );
  }
}



