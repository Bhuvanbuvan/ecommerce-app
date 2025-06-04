import 'package:flutter/material.dart';
import 'dart:async';


// Product Details Screen
class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  String selectedColor = 'Black';
  List<String> colors = ['Red', 'Black', 'Blue', 'Brown', 'White'];

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> product = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? 
    {
      'name': 'Wireless Headphone',
      'price': '\$520.00',
      'rating': 4.5,
      'reviews': 200,
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.headphones,
                        size: 120,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Title and Price
                        Text(
                          product['name'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product['price'],
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(height: 8),
                        
                        // Rating and Reviews
                        Row(
                          children: [
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < 4 ? Icons.star : Icons.star_border,
                                  color: Colors.amber,
                                  size: 20,
                                );
                              }),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '${product['rating'] ?? 4.5} (${product['reviews'] ?? 200} Review)',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        
                        // Seller Info
                        Text(
                          'Seller: Tariqul isalm',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 20),
                        
                        // Color Selection
                        Text(
                          'Color',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: colors.map((color) {
                            Color colorValue;
                            switch (color) {
                              case 'Red':
                                colorValue = Colors.red;
                                break;
                              case 'Black':
                                colorValue = Colors.black;
                                break;
                              case 'Blue':
                                colorValue = Colors.blue;
                                break;
                              case 'Brown':
                                colorValue = Colors.brown;
                                break;
                              case 'White':
                                colorValue = Colors.grey[300]!;
                                break;
                              default:
                                colorValue = Colors.grey;
                            }
                            
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = color;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 12),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: colorValue,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selectedColor == color ? Colors.orange : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 20),
                        
                        // Tabs
                        DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              TabBar(
                                labelColor: Colors.orange,
                                unselectedLabelColor: Colors.grey,
                                indicatorColor: Colors.orange,
                                tabs: [
                                  Tab(text: 'Description'),
                                  Tab(text: 'Specifications'),
                                  Tab(text: 'Reviews'),
                                ],
                              ),
                              Container(
                                height: 100,
                                child: TabBarView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Text(
                                        'Lorem ipsum dolor sit amet consectetur. Placerat ut tempor viverra ut mauris non purus vitae mollis tellus. Integer ornare. Purus risus amet sed fermentum. Neque dolor tempor ut mauris egestas nunc.',
                                        style: TextStyle(color: Colors.grey[600]),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Text('Product specifications will be displayed here.'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Text('Customer reviews will be displayed here.'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Section with Quantity and Add to Cart
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                // Quantity Selector
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(
                        quantity.toString(),
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                
                // Add to Cart Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add to cart functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added to cart!'),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}