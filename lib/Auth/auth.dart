import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoesstore/Auth/register_or_login.dart';
import 'package:shoesstore/productPage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Is the user logged in?
          if (snapshot.hasData) {
            return const ProductPage();
          }
          // Is the user not logged in?
          else {
            return const LoginRegister();
          }
        },
      ),
    );
  }
}
