import 'package:bookstore/category_of_books/fiction.dart';
import 'package:bookstore/category_of_books/non-fiction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/drawer.dart';
import 'package:bookstore/productoverview.dart';

class Myviewmore_nonfiction extends StatelessWidget {
  final User? user;
  const Myviewmore_nonfiction({super.key, required this.user});

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
                builder: (context) => Mycategorynonfiction(user: user),
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
    'imagePath': 'assets/images/non fiction books/sapiens.jpg',
    'name': 'Sapiens',
    'price': 'Rs.599',
  },
  {
    'serialNo': '00001',
    'imagePath': 'assets/images/non fiction books/Educated.jpg',
    'name': 'Educated',
    'price': 'Rs.599',
  },
  {
    'serialNo': '00002', // Changed serial number from '00001' to '00002' to avoid duplication
    'imagePath': 'assets/images/non fiction books/Becoming.jpg',
    'name': 'Becoming',
    'price': 'Rs.599',
  },
  {
    'serialNo': '00003',
    'imagePath': 'assets/images/non fiction books/The Immortal Life of Henrietta Lacks.jpg',
    'name': 'The Immortal Life of Henrietta Lacks',
    'price': 'Rs.599',
  },
  {
    'serialNo': '00004',
    'imagePath': 'assets/images/non fiction books/The Power of Habit.jpg',
    'name': 'The Power of Habit',
    'price': 'Rs.599',
  },
  {
    'serialNo': '00005',
    'imagePath': 'assets/images/non fiction books/Born a Crime.jpg',
    'name': 'Born a Crime',
    'price': 'Rs.599',
  },
  {
    'serialNo': '00006',
    'imagePath': 'assets/images/non fiction books/Quiet.jpg',
    'name': 'Quiet',
    'price': 'Rs.599',
  },
   {
    'serialNo': '00003',
    'imagePath': 'assets/images/non fiction books/The Immortal Life of Henrietta Lacks.jpg',
    'name': 'The Immortal Life of Henrietta Lacks',
    'price': 'Rs.599',
  },
  {
    'serialNo': '00004',
    'imagePath': 'assets/images/non fiction books/The Power of Habit.jpg',
    'name': 'The Power of Habit',
    'price': 'Rs.599',
  },
  {
    'serialNo': '00005',
    'imagePath': 'assets/images/non fiction books/Born a Crime.jpg',
    'name': 'Born a Crime',
    'price': 'Rs.599',
  },
  {
    'serialNo': '00006',
    'imagePath': 'assets/images/non fiction books/Quiet.jpg',
    'name': 'Quiet',
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
            'Non-Fiction Books',
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
