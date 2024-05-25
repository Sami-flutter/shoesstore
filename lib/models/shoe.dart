class Shoe {
  final String name;
  final String imageUrl;
  final String price;
  int quantity;

  Shoe({required this.name, required this.imageUrl, required this.price, this.quantity = 1});
}
