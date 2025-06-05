// controllers/cart_controller.dart
import 'package:ecommerce/features/model/cart.dart';
import 'package:get/get.dart';
import '../model/product.dart';

class CartController extends GetxController with StateMixin {
  var cartItems = <CartItem>[].obs;

  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartItem(product: product));
    }
  }

  void increaseQuantity(int index) {
    cartItems[index].quantity++;
    update();
  }

  void decreaseQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
    } else {
      cartItems.removeAt(index);
    }
    update();
  }

  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
    update(); // Triggers UI rebuild
  }

  double get totalPrice => cartItems.fold(
      0.0, (sum, item) => sum + item.product.price * item.quantity);
}
