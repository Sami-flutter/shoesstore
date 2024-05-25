import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shoesstore/models/shoe.dart';
import 'package:shoesstore/models/shoe_tile.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoeTile>(
      builder: (context, shoeTile, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {
                // Handle more options button press
              },
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: shoeTile.usercart.length,
                  itemBuilder: (context, index) {
                    final shoe = shoeTile.cartList[index];
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      secondaryActions: [
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () => shoeTile.removeitem(shoe),
                        ),
                      ],
                      child: ShoppingCartItem(
                        shoe: shoe,
                        onRemove: () {
                          shoeTile.removeitem(shoe);
                        },
                        onQuantityChange: (quantity) {
                          shoeTile.updateQuantity(shoe, quantity);
                        },
                      ),
                    );
                  },
                ),
              ),
              Divider(),
              UserSection(),
              Divider(),
              PaymentSection(
                cartList: shoeTile.cartList,
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class ShoppingCartItem extends StatelessWidget {
  final Shoe shoe;
  final VoidCallback onRemove;
  final ValueChanged<int> onQuantityChange;

  ShoppingCartItem({
    required this.shoe,
    required this.onRemove,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            shoe.imageUrl,
            height: 60,
            width: 60,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoe.name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'An armchair is a plush and comfortable on.',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      shoe.price,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Text('4.5'),
                    SizedBox(width: 16),
                    QuantityControl(
                      quantity: shoe.quantity,
                      onQuantityChange: onQuantityChange,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityControl extends StatefulWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChange;

  QuantityControl({required this.quantity, required this.onQuantityChange});

  @override
  _QuantityControlState createState() => _QuantityControlState();
}

class _QuantityControlState extends State<QuantityControl> {
  int quantity;

  _QuantityControlState() : quantity = 1;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove, size: 16),
          onPressed: () {
            setState(() {
              if (quantity > 1) {
                quantity--;
                widget.onQuantityChange(quantity);
              }
            });
          },
        ),
        Text('$quantity'),
        IconButton(
          icon: const Icon(Icons.add, size: 16),
          onPressed: () {
            setState(() {
              quantity++;
              widget.onQuantityChange(quantity);
            });
          },
        ),
      ],
    );
  }
}

class UserSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('lib/images/user.png'),
          radius: 24,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Samiir Philips', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Icon(Icons.star, color: Colors.deepOrange, size: 16),
                Text('4.5'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PaymentSection extends StatelessWidget {
  final List<Shoe> cartList;

  const PaymentSection({required this.cartList});

  @override
  Widget build(BuildContext context) {
    double subtotal = 0;
    for (var shoe in cartList) {
      subtotal += double.parse(shoe.price.replaceFirst('\$', '')) * shoe.quantity;
    }
    double deliveryFee = 20.0;
    double total = subtotal + deliveryFee;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.payment, size: 24),
            SizedBox(width: 16),
            Text('Payment', style: TextStyle(fontSize: 18)),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Fee:'),
            Text('\$$deliveryFee'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal:'),
            Text('\$$subtotal'),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '\$$total',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
