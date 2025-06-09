import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  void addToCart(ProductModel product, {int quantity = 1}) {
    final existingItemIndex = cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingItemIndex >= 0) {
      cartItems[existingItemIndex].quantity += quantity;
    } else {
      cartItems.add(CartItem(product: product, quantity: quantity));
    }
    cartItems.refresh();
  }

  void removeFromCart(String productId) {
    cartItems.removeWhere((item) => item.product.id == productId);
  }

  void increaseQuantity(String productId) {
    final index = cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
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
    return cartItems.fold<double>(
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
