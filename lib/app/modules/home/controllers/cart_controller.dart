// cart_controller.dart
import 'package:get/get.dart';
import 'package:minutes_magic_app/app/modules/allcategory/model/product_model.dart';

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;

  void addToCart(ProductModel product, {int quantity = 1}) {
    final existingIndex = cartItems.indexWhere((item) => item.product.name == product.name);

    if (existingIndex >= 0) {
      // Item already in cart, increase quantity
      cartItems[existingIndex] = cartItems[existingIndex].copyWith(
          quantity: cartItems[existingIndex].quantity + quantity
      );
    } else {
      // Add new item to cart
      cartItems.add(CartItem(
        product: product,
        quantity: quantity,
      ));
    }
    Get.snackbar(
      'Added to Cart',
      '${product.name} has been added to your cart',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void removeFromCart(String productId) {
    cartItems.removeWhere((item) => item.product.name == productId);
  }

  void updateQuantity(String productId, int newQuantity) {
    final index = cartItems.indexWhere((item) => item.product.name == productId);
    if (index >= 0) {
      if (newQuantity > 0) {
        cartItems[index] = cartItems[index].copyWith(quantity: newQuantity);
      } else {
        removeFromCart(productId);
      }
    }
  }

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }
}

class CartItem {
  final ProductModel product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  CartItem copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}