import 'package:flutter/material.dart';
import 'package:shoesstore/productPage.dart';
class Splash2 extends StatelessWidget {
  const Splash2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 182, 34, 5),  Color.fromARGB(255, 252, 105, 41)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const SizedBox(height: 70),
           
            //SizedBox(height: 20),
            Image.asset(
              'lib/images/splash.png', // Replace with the actual image URL
              height: 300,
              width: 300,
            ),
           const  SizedBox(height: 20),
           const  Text(
              'NEW COLLECTION',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '2023',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
           const  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'This shoe is the perfect choice for anyone looking '
                'for style and comfort all in one. With a modern and '
                'elegant design, it has a premium.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: ElevatedButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>  ProductPage(),));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Use backgroundColor instead of primary
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
