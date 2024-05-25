import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesstore/models/shoe.dart';
import 'package:shoesstore/models/shoe_tile.dart';
import 'package:shoesstore/pages/chektou.dart';
import 'package:shoesstore/productPage.dart';
class NikeAirMaxScreen extends StatefulWidget {
  final Shoe shoe;
  const NikeAirMaxScreen({
    required this.shoe,
    super.key});
  @override
  _NikeAirMaxScreenState createState() => _NikeAirMaxScreenState();
}

class _NikeAirMaxScreenState extends State<NikeAirMaxScreen> {
  String selectedSize = '9.5';
  String selectedColor = 'blue';
  @override
  Widget build(BuildContext context) {
  void navigateCartpage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoppingCartScreen(),
      ),
    );
  }
  void addToCart()
  {
    final product = context.read<ShoeTile>();
    product.addtocart(widget.shoe);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) =>   AlertDialog(
       backgroundColor:  Colors.grey[300],
       content:  const Padding(
         padding:  EdgeInsets.all(20),
         child:  Text('Successfully Added to the cart',
         style: TextStyle(fontSize: 18,color: Colors.black),
         ),
       ),
       actions: [
        IconButton(onPressed: () {
        
        Navigator.pop(context);
        Navigator.pop(context);
        navigateCartpage();
        },
         
        icon: const Icon(Icons.done,color: Colors.black12,)
        
        )
        
       ],
       
       )
       
       );
  }
   
  
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
            Navigator.push(context, MaterialPageRoute(builder: (context) => 
            ProductPage(),
          ));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Text(
                    widget.shoe.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Men's Shoes",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Size',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: ['9', '9.5', '10', '10.5'].map((size) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: selectedSize == size ? Colors.black : Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              size,
                              style: TextStyle(
                                color: selectedSize == size ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      widget.shoe.imageUrl, // Add your image asset here
                      height: 250,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Fav',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          // Implement favorite functionality here
                        },
                      ),
                      const Text(
                        'Color',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          {'color': 'blue', 'dotColor': Colors.blue},
                          {'color': 'orange', 'dotColor': Colors.orange},
                        ].map((colorMap) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor = colorMap['color'] as String;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colorMap['dotColor'] as Color,
                                border: Border.all(
                                  color: selectedColor == colorMap['color'] ? Colors.black : Colors.grey,
                                  width: 2,
                                ),
                              ),
                              width: 24,
                              height: 24,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
           const  SizedBox(height: 16),
          const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
           const  SizedBox(height: 8),
          const  Text(
              'This shoe is the perfect choice for anyone looking for style and comfort' 
              'all in one. With a This shoe is the perfect choice for anyone looking for '
              'style and comfort modern and elegant design, This shoe is the perfect choice for '
              'anyone looking for style and comfortit has a premium...',
              
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
             Text(
              widget.shoe.price,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                    addToCart();
                    },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Get It Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
