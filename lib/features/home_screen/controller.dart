import 'package:ecommerce/features/model/product.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController with StateMixin {
  List<Product> products = [];
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    change(null, status: RxStatus.loading());
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      products = data.map((json) => Product.fromJson(json)).toList();
      change(products, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
      throw Exception('Failed to load products');
    }
  }
}
