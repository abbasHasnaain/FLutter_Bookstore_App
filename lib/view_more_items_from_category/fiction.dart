import 'package:bookstore/category_of_books/fiction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/drawer.dart';
import 'package:bookstore/productoverview.dart';

class Myviewmore_fiction extends StatelessWidget {
  final User? user;
  const Myviewmore_fiction({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Mycategoryfiction(user: user),
              ),
            );
          },
        ),
      ),
      drawer: const Drawer(), // Add drawer content here
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildScanningHistory(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildScanningHistory(BuildContext context) {
  List<Map<String, String>> books = [
    {
      'serialNo': '00000',
      'imagePath': 'assets/images/fiction books/The Whispering Shadows.jpg',
      'name': 'The Whispering Shadows',
      'price': 'Rs.599',
    },
    {
      'serialNo': '00001',
      'imagePath': 'assets/images/fiction books/Beneath the Crimson Sky.jpg',
      'name': 'Beneath the Crimson Sky',
      'price': 'Rs.599',
    },
    {
      'serialNo': '00002',
      'imagePath': 'assets/images/fiction books/The Reappearance of Rachel Price.jpg',
      'name': 'The Reappearance of Rachel Price',
      'price': 'Rs.599',
    },
    {
      'serialNo': '00003',
      'imagePath': 'assets/images/fiction books/Tales of the Silver Sea.jpg',
      'name': 'Tales of the Silver Sea',
      'price': 'Rs.599',
    },
    {
      'serialNo': '00004',
      'imagePath': 'assets/images/fiction books/Memory Piece.jpg',
      'name': 'Memory Piece',
      'price': 'Rs.599',
    },
    {
      'serialNo': '00005',
      'imagePath': 'assets/images/fiction books/The Women by Kristin Hannah.jpg',
      'name': 'The Women by Kristin Hannah',
      'price': 'Rs.599',
    },
     {
      'serialNo': '00001',
      'imagePath': 'assets/images/fiction books/Beneath the Crimson Sky.jpg',
      'name': 'Beneath the Crimson Sky',
      'price': 'Rs.599',
    },
    {
      'serialNo': '00002',
      'imagePath': 'assets/images/fiction books/The Reappearance of Rachel Price.jpg',
      'name': 'The Reappearance of Rachel Price',
      'price': 'Rs.599',
    },
    {
      'serialNo': '00003',
      'imagePath': 'assets/images/fiction books/Tales of the Silver Sea.jpg',
      'name': 'Tales of the Silver Sea',
      'price': 'Rs.599',
    },
    {
      'serialNo': '00004',
      'imagePath': 'assets/images/fiction books/Memory Piece.jpg',
      'name': 'Memory Piece',
      'price': 'Rs.599',
    },
    {
      'serialNo': '00005',
      'imagePath': 'assets/images/fiction books/The Women by Kristin Hannah.jpg',
      'name': 'The Women by Kristin Hannah',
      'price': 'Rs.599',
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Fiction Books',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Column(
        children: books.map((book) {
          return _buildScanHistoryItem(
            book['serialNo']!,
            book['imagePath']!,
            book['name']!,
            book['price']!,
            context,
          );
        }).toList(),
      ),
    ],
  );
}

Widget _buildScanHistoryItem(String serialNo, String imagePath, String name, String price, BuildContext context) {
  return Card(
    color: const Color.fromARGB(255, 248, 246, 246),
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: ListTile(
      leading: Image.asset(imagePath, height: 50),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$serialNo\n$price'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.green,
            ),
          ),
          const Text(
            'Add to cart',
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    ),
  );
}
