import 'package:flutter/material.dart';
import 'package:shoesstore/models/shoe.dart';

class CollectionBanner extends StatelessWidget {
  final Shoe shoe;
   CollectionBanner({
    required this.shoe,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370, // Set a fixed width for the horizontal scroll
      margin: const EdgeInsets.only(right: 10), // Margin to separate banners
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      shoe.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Nike Best Shoes For Week',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: const Text(
                        'Shop Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 1.5, // Adjust the scale factor as needed
                child: Image.asset(
                  shoe.imageUrl, // Replace with the actual image file name
                  height: 140,
                  width: 140,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.red,
              ),
              SizedBox(width: 5),
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.grey,
              ),
              SizedBox(width: 5),
              CircleAvatar(
                radius: 5,
                backgroundColor: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
