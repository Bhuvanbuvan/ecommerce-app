import 'package:ecommerce/features/home_screen/controller.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';

// Category Products Screen
class CategoryProductsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Nike Air Max',
      'price': '\$150.00',
      'rating': 4.5,
      'reviews': 120,
    },
    {
      'name': 'Adidas Ultraboost',
      'price': '\$180.00',
      'rating': 4.7,
      'reviews': 95,
    },
    {
      'name': 'Puma Running Shoes',
      'price': '\$90.00',
      'rating': 4.2,
      'reviews': 67,
    },
    {
      'name': 'Converse All Star',
      'price': '\$60.00',
      'rating': 4.0,
      'reviews': 88,
    },
  ];
  DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final String categoryName =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'Products';

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          categoryName,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 17,
          childAspectRatio: 0.65,
        ),
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          final product = controller.products[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-details',
                arguments: product,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Text(
                                ' ${product.rating} (${product.rating})',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            product.price.toString(),
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
