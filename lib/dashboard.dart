import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_demo/services/authenticaiton_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "User logged in by ${user!.email} ",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().logout();
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
