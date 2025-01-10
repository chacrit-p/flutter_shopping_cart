import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/models/product_model.dart';

class CartProvider with ChangeNotifier {
  final Map<ProductModel, int> _cartItems = {};

  Map<ProductModel, int> get cartItems => _cartItems;

  void addToCart(ProductModel product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    if (_cartItems.containsKey(product) && _cartItems[product]! > 1) {
      _cartItems[product] = _cartItems[product]! - 1;
    } else {
      _cartItems.remove(product);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    _cartItems.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }
}
