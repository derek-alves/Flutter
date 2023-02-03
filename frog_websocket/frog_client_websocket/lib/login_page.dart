import 'package:flutter/material.dart';
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
      body: SizedBox.expand(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                onPressed: () async {
                  var value = await GoogleSignIn().signIn();
                  var auth = await value?.authentication;
                  print(auth?.accessToken);
                },
                label: const Text("Sign in with google"),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                onPressed: () async {
                  var value = await GoogleSignIn().signOut();
                  print(value);
                },
                label: const Text("logou in with google"),
              ),
            ]),
      ),
    );
  }
}
