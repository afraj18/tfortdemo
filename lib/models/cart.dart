// import 'package:tfortdemo/models/Product.dart';
import 'package:tfortdemo/models/Product_Model.dart';

class Cart {
  final ProductModel product;
  final int numOfItem;
  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

// List<Cart> demoCarts = [
//   Cart(product: demoProduct[0], numOfItem: 2),
//   Cart(product: demoProduct[1], numOfItem: 1),
//   Cart(product: demoProduct[2], numOfItem: 1),
// ];
