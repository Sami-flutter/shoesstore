import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.deepOrange,
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Image.asset('lib/images/splash1.png'),
        Text('New Collection'),
        Text('2024'),
       ],),
       
    );
  }
}