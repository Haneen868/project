// ignore_for_file: camel_case_types, unrelated_type_equality_checks, non_constant_identifier_names, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffic_sign/components/reusable.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  bool secure = true;
  var FormKey = GlobalKey<FormState>();
  Future signup() async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());
    Navigator.of(context).pushNamed('/');
  }

  void dispose2() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: FormKey,
              child: Column(children: [
                const SizedBox(height: 20),
                Image.asset(
                  'images/traffic-sign.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  'Sign Up',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 60, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Welcome Here You Can Sign Up',
                  style: GoogleFonts.robotoCondensed(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                textreuse(
                  controller: _emailcontroller,
                  keyboardtype: TextInputType.emailAddress,
                  validattext: 'E-Mail Must Not Be Empt',
                  text: 'E-Mail Adress',
                  prefixIcon: Icons.email_outlined,
                  redius: 12,
                  cursorcolor: Colors.blue,
                ),
                const SizedBox(
                  height: 20,
                ),
                textreuse(
                  controller: _passwordcontroller,
                  keyboardtype: TextInputType.visiblePassword,
                  validattext: 'Password Must Not Be Empt',
                  text: 'Password',
                  prefixIcon: Icons.lock_outline,
                  redius: 12,
                  obscureText: secure,
                  suffixIcon: (secure && _passwordcontroller != '')
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  suffixpressed: () {
                    if (_passwordcontroller != '') {
                      setState(() {
                        secure = !secure;
                      });
                    }
                  },
                  cursorcolor: Colors.blue,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () {
                        if (FormKey.currentState!.validate()) {
                          signup();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
              ]
                  //image

                  //title

                  //subtitle

                  //email

                  //pasword

                  //sign in

                  //text

                  ),
            ),
          ),
        ),
      ),
    );
  }
}
