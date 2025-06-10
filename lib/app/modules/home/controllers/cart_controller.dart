// cart_controller.dart
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  bool addToCart(ProductModel product, {int quantity = 1}) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index > 0) {
      // Product already in cart
      Fluttertoast.showToast(
        msg: "Product already exists in cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orangeAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return false;
    }

    if (cartItems.length >= 6) {
      Fluttertoast.showToast(
        msg: "You can't add more than 6 different products to the cart.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return false;
    }

    cartItems.add(CartItem(product: product, quantity: quantity));
    cartItems.refresh();

    Fluttertoast.showToast(
      msg: "Product added to cart",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    return true;
  }

  void removeFromCart(String productId) {
    cartItems.removeWhere((item) => item.product.id == productId); // ✅ fixed
  }

  void updateQuantity(String productId, int newQuantity) {
    final index = cartItems.indexWhere((item) => item.product.id == productId); // ✅ fixed
    if (index >= 0) {
      if (newQuantity > 0) {
        cartItems[index] = cartItems[index].copyWith(quantity: newQuantity);
      } else {
        removeFromCart(productId);
      }
      cartItems.refresh(); // ✅ ensure UI updates
    }
  }

  double get totalPrice {
    return cartItems.fold(
      0,
          (sum, item) => sum + (item.product.price * item.quantity),
    );
  }
}

class CartItem {
  final ProductModel product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  CartItem copyWith({ProductModel? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
