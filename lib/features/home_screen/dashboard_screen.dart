import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/features/home_screen/controller.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';

// Dashboard Screen

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Shoes', 'icon': Icons.sports_baseball, 'color': Colors.blue},
    {
      'name': 'Beauty',
      'icon': Icons.face_retouching_natural,
      'color': Colors.pink,
    },
    {'name': 'Women\'s Fashion', 'icon': Icons.woman, 'color': Colors.purple},
    {'name': 'Jewelry', 'icon': Icons.diamond, 'color': Colors.amber},
    {'name': 'Men\'s Fashion', 'icon': Icons.man, 'color': Colors.green},
    {
      'name': 'Electronics',
      'icon': Icons.phone_android,
      'color': Colors.indigo,
    },
  ];

  final List<Map<String, dynamic>> featuredProducts = [
    {
      'name': 'Wireless Headphones',
      'price': '\$120.00',
      'image': 'assets/headphones.jpg',
      'rating': 4.5,
    },
    {
      'name': 'Woman Sweater',
      'price': '\$120.00',
      'image': 'assets/sweater.jpg',
      'rating': 4.2,
    },
  ];

  final List<Map<String, String>> banners = [
    {
      'title': 'Super Sale',
      'subtitle': 'Discount',
      'offer': 'Up to 50%',
      'image': 'assets/banner1.jpg',
    },
    {
      'title': 'Mega Deal',
      'subtitle': 'Today Only',
      'offer': 'Flat 30%',
      'image': 'assets/banner2.jpg',
    },
    {
      'title': 'Flash Offer',
      'subtitle': 'Limited Time',
      'offer': 'Buy 1 Get 1',
      'image': 'assets/banner3.jpg',
    },
  ];

  DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.apps, color: Colors.black),
            Spacer(),
            Icon(Icons.notifications_outlined, color: Colors.black),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
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
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 24),

            // Sale Banner
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.2,
                autoPlayInterval: Duration(seconds: 3),
              ),
              items:
                  banners.map((banner) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            banner['image']!,
                            fit: BoxFit.fitWidth,
                          ),
                        );
                        // return Container(
                        //   width: double.infinity,
                        //   padding: EdgeInsets.all(24),
                        //   decoration: BoxDecoration(
                        //     gradient: LinearGradient(
                        //       colors: [Colors.orange, Colors.deepOrange],
                        //       begin: Alignment.centerLeft,
                        //       end: Alignment.centerRight,
                        //     ),
                        //     borderRadius: BorderRadius.circular(16),
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //               banner['title']!,
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 24,
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //             Text(
                        //               banner['subtitle']!,
                        //               style: TextStyle(color: Colors.white, fontSize: 20),
                        //             ),
                        //             Text(
                        //               banner['offer']!,
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontSize: 28,
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //             SizedBox(height: 8),
                        //             ElevatedButton(
                        //               onPressed: () {},
                        //               style: ElevatedButton.styleFrom(
                        //                 backgroundColor: Colors.white,
                        //                 foregroundColor: Colors.orange,
                        //               ),
                        //               child: Text('Shop Now'),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Icon(
                        //         Icons.shopping_bag_outlined,
                        //         size: 80,
                        //         color: Colors.white.withOpacity(0.3),
                        //       ),
                        //     ],
                        //   ),
                        // );
                      },
                    );
                  }).toList(),
            ),
            SizedBox(height: 24),

            // Categories
            SizedBox(
              height: 120, // உங்கள் items க்கு தேவையான height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/category-products',
                        arguments: category['name'],
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: category['color'].withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              category['icon'],
                              color: category['color'],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(category['name']),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),

            // Special For You Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Special For You',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/category-products',
                      arguments: 'Special for You',
                    );
                  },
                  child: Text('See all'),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Featured Products
            GetBuilder<DashboardController>(
              builder: (controller) {
                return controller.obx(
                  (products) => GridView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/product-details',
                            arguments:
                                product, // Pass the entire Product object
                          );
                        },

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),

                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, -2),
                              ),
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),

                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, -2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                product.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  onLoading: Center(child: CircularProgressIndicator()),
                  onEmpty: Center(child: Text('No products found')),
                  onError: (error) => Center(child: Text('Error: $error')),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/cart'),
              child: Icon(Icons.shopping_cart_outlined),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/cart');
          }
        },
      ),
    );
  }
}
