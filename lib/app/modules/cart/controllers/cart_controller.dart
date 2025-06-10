import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  static const int maxDifferentProducts = 6;
  static const int maxQuantityPerProduct = 9;

  void addToCart(ProductModel product, {int quantity = 1}) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);

    if (index >= 0) {
      // Already in cart, just increase quantity
      final newQuantity = cartItems[index].quantity + quantity;
      if (newQuantity > maxQuantityPerProduct) {
        Fluttertoast.showToast(
          msg: "Maximum $maxQuantityPerProduct items allowed per product.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
      cartItems[index].quantity = newQuantity;
    } else {
      if (cartItems.length >= maxDifferentProducts) {
        Get.snackbar(
          "Only $maxDifferentProducts Products Allowed",
          "You can't add more than $maxDifferentProducts different products to the cart.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          borderRadius: 10,
        );
        return;
      }
      cartItems.add(CartItem(product: product, quantity: quantity));
    }
    cartItems.refresh();
  }

  void removeFromCart(String productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
    cartItems.refresh();
  }

  void increaseQuantity(String productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (cartItems[index].quantity >= maxQuantityPerProduct) {
        Fluttertoast.showToast(
          msg: "You can only add up to $maxQuantityPerProduct items for this product.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decreaseQuantity(String productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
      cartItems.refresh();
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
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
