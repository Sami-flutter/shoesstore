import 'package:flutter/cupertino.dart';
import 'package:shoesstore/models/shoe.dart';

class ShoeTile extends ChangeNotifier {
  final List<Shoe> shoes = [
    Shoe(name: 'Nike Air Max Motion 2', imageUrl: 'lib/images/splash1.png', price: '\$140.00'),
    Shoe(name: 'Nike Air Max Sneakers', imageUrl: 'lib/images/2.jpg', price: '\$132.00'),
    Shoe(name: 'Nike Air Max Motion 2', imageUrl: 'lib/images/3.jpg', price: '\$140.00'),
    Shoe(name: 'Nike Air Max Sneakers', imageUrl: 'lib/images/4.jpg', price: '\$132.00'),
    Shoe(name: 'Nike Air Max Sneakers', imageUrl: 'lib/images/4.jpg', price: '\$132.00'),
    Shoe(name: 'Nike Air Max Sneakers', imageUrl: 'lib/images/4.jpg', price: '\$132.00'),
  ];

  List<Shoe> usercart = [];

  List<Shoe> getallshoes() {
    return shoes;
  }

  List<Shoe> get cartList => usercart;

  void addtocart(Shoe item) {
    usercart.add(item);
    notifyListeners();
  }

  void removeitem(Shoe item) {
    usercart.remove(item);
    notifyListeners();
  }

  void updateQuantity(Shoe item, int quantity) {
    item.quantity = quantity;
    notifyListeners();
  }
}
