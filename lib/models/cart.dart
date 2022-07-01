import 'package:tfortdemo/models/Product.dart';

class Cart {
  final Product product;
  final int numOfItem;
  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demo_product[0], numOfItem: 2),
  Cart(product: demo_product[1], numOfItem: 1),
  Cart(product: demo_product[3], numOfItem: 1),
];
