import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login"),
      ),
      body: Center(
        child: FloatingActionButton.extended(
          onPressed: () async {
            var value = await GoogleSignIn().signIn();
            print(value);
          },
          label: const Text("Sign in with google"),
        ),
      ),
    );
  }
}
