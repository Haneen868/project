// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traffic_sign/Screen/homeScreen.dart';
import 'package:traffic_sign/Screen/login_Screen.dart';

class auth extends StatelessWidget {
  const auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (((context, snapshot) {
        if (snapshot.hasData) {
          return const homeScreen();
        } else {
          return const loginScreen();
        }
      })),
    ));
  }
}
