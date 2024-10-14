// import 'package:bookstore/cart_provider.dart';
// import 'package:bookstore/cartlist.dart';
// import 'package:bookstore/product_model.dart';
import 'package:bookstore/productoverview.dart';
import 'package:flutter/material.dart';

class MyProductCard extends StatelessWidget {
  const MyProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Fixed dimensions for the cards
    const double cardWidth = 140.0;
    const double cardHeight = 260.0; // Adjust height to fit larger image
    const double imageHeight = 200.0; // Increased height for the image

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal:
              10.0), // Add horizontal padding to create margins on the sides
      child: Wrap(
        spacing: 10.0, // Space between cards
        runSpacing: 10.0, // Space between rows of cards
        children: [
          // Product Cards
          _buildProductCard(context, 'assets/images/1.jpeg', "Book 1",
              "Rs. 800", cardWidth, cardHeight, imageHeight),
          _buildProductCard(context, 'assets/images/2.jpeg', "Book 2",
              "Rs. 800", cardWidth, cardHeight, imageHeight),
          _buildProductCard(context, 'assets/images/3.jpeg', "Book 3",
              "Rs. 800", cardWidth, cardHeight, imageHeight),
          _buildProductCard(context, 'assets/images/4.jpeg', "Book 4",
              "Rs. 800", cardWidth, cardHeight, imageHeight),
          _buildProductCard(context, 'assets/images/5.jpeg', "Book 5",
              "Rs. 800", cardWidth, cardHeight, imageHeight),
          _buildProductCard(context, 'assets/images/6.jpeg', "Book 6",
              "Rs. 800", cardWidth, cardHeight, imageHeight),
          _buildProductCard(context, 'assets/images/7.jpeg', "Book 7",
              "Rs. 800", cardWidth, cardHeight, imageHeight),
          _buildProductCard(context, 'assets/images/8.jpeg', "Book 8",
              "Rs. 800", cardWidth, cardHeight, imageHeight),
          _buildProductCard(context, 'assets/images/9.jpeg', "Book 9",
              "Rs. 800", cardWidth, cardHeight, imageHeight),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String imagePath, String name,
      String price, double cardWidth, double cardHeight, double imageHeight) {
    return Container(
      width: cardWidth, // Fixed width
      height: cardHeight, // Adjusted height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
           color: const Color.fromARGB(255, 248, 246, 246),

      ),
      child: Column(
        children: [
          // GestureDetector around the image
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => My_productoverview(
                    imagePath: imagePath,
                    name: name,
                    price: price,
                  ),
                ),
              );
            },
            child: Container(
              height: imageHeight, // Increased height for the image
              width: cardWidth, // Ensure the image fills the width of the card
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover, // Scale image to cover container
              ),
            ),
          ),
          // Product details section (name and price)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              name, // Display product name
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Center align the text
            ),
          ),
          Text(price,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
