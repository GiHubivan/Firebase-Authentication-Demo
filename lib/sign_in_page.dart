import 'dart:developer';
import 'package:firebase_auth_demo/services/authenticaiton_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: "Email"),
              controller: _emailTextEditingController,
            ),
            const SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(hintText: "Password"),
              controller: _passwordTextEditingController,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () async {
                  String message = await context
                      .read<AuthenticationService>()
                      .signIn(_emailTextEditingController.text,
                          _passwordTextEditingController.text);
                  log("Login Message : $message");
                },
                child: const Text("Sign In")),
          ],
        ),
      ),
    );
  }
}
