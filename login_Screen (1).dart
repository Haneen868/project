// ignore_for_file: non_constant_identifier_names, camel_case_types, unrelated_type_equality_checks, avoid_print, file_names, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traffic_sign/components/reusable.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  
  void dispose() {
    _controller.dispose();
    super.dispose();
  }




  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  bool secure = true;
  var FormKey = GlobalKey<FormState>();
  Future signin() async {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());
        

  }

  void openSignUpScreen() {
    Navigator.of(context).pushReplacementNamed('SignUpScreen');
  }

  void dispose1() {
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
                const Text(
                  'Log In',
                  style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),
                ),
                Text(
                  'Welcome Back Nice To See You Again',
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
                  suffixIcon: (secure&&_passwordcontroller!='')
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  suffixpressed: () {
                    if (_passwordcontroller !='') {
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
                      onTap: () async {
                        if (FormKey.currentState!.validate()) {
                          try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailcontroller.text.trim(),
    password: _passwordcontroller.text.trim()
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not yet a member?'),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: openSignUpScreen,
                      child: Text(
                        'Sign Up Now',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
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
