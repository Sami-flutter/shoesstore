import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesstore/models/shoe_tile.dart';
import 'package:shoesstore/models/shoe.dart';
import 'package:shoesstore/pages/banner.dart';
import 'package:shoesstore/pages/chektou.dart';
import 'package:shoesstore/pages/my_drawer.dart';
import 'package:shoesstore/pages/popularitem.dart';
import 'package:shoesstore/pages/productdetails.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //leading: const Icon(Icons.menu, color: Colors.black),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => const ShoppingCartScreen(),
            )),
            child: const Icon(Icons.shopping_cart, color: Colors.black),
          ),
          const SizedBox(width: 20),
        ],
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Collection',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Nike original',
              style: TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200, // Set an appropriate height for the banner section
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CollectionBanner(shoe: Shoe(
                  name: 'Nike Max Air 270', 
                  imageUrl: 'lib/images/splash.png', 
                  price: '20'),),
                  CollectionBanner(shoe: Shoe(
                  name: 'Nike Ultimate 270', 
                  imageUrl: 'lib/images/3.jpg', 
                  price: '20'),),
                  // Add more CollectionBanner widgets here if needed
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 55,
                    height: 30,
                    color: const Color.fromARGB(255, 207, 208, 218),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 16, top: 8),
                      child: Text(
                        'All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PopularPage(),
                    )),
                    child: Container(
                      width: 55,
                      height: 30,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Text(
                          'Popular',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 55,
                  height: 30,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text(
                      'Running',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Consumer<ShoeTile>(
                builder: (context, shoeTile, child) {
                  if (shoeTile.getallshoes().isEmpty) {
                    return const Center(child: Text('No shoes available'));
                  }
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: shoeTile.getallshoes().length,
                    itemBuilder: (context, index) {
                      final shoe = shoeTile.getallshoes()[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to the product details page with the selected shoe
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NikeAirMaxScreen(shoe: shoe),
                            ),
                          );
                        },
                        child: buildProductCard(context, shoe),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget buildProductCard(BuildContext context, Shoe shoe) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            shoe.imageUrl, // Use local asset image
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            shoe.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                shoe.price,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(width: 8), // Add some space between the price and the icon
              const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
