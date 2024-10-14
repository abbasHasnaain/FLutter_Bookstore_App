import 'package:bookstore/home.dart';
import 'package:bookstore/productoverview.dart';
import 'package:bookstore/view_more_items_from_category/fiction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/drawer.dart';
import 'package:bookstore/productoverview.dart';
import 'package:bookstore/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookstore/credentials/login.dart';


class Mycategoryfiction extends StatelessWidget {

  final User? user;
  const Mycategoryfiction({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            
          },
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Myhome()));},
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text( "${user?.displayName ?? "user"}", style: const TextStyle(color: Colors.black,fontSize: 15)),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundImage: user?.photoURL != null
                          ? NetworkImage(user!.photoURL!) // Load image from URL
                          : const AssetImage('assets/images/profile-picture.jpeg') as ImageProvider,
              radius: 18,
            ),
            const SizedBox(width: 10),
            
          ],
        ),
      ),
      drawer: const Drawer(), // Add drawer content here
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRetailNetworkSearch(),
              const SizedBox(height: 15),
              _buildCounterfeitAlert(),
              const SizedBox(height: 20),
              _buildScanningHistory(context),
            ],
          ),
        ),
      ),
     
    );
  }

  Widget _buildRetailNetworkSearch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fiction',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(
                  'assets/images/2.jpeg'), //add a fiction banner image//
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search By Name',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCounterfeitAlert() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hot Selling Book',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '',
              style: TextStyle(color: Colors.green, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color:  const Color.fromARGB(255, 240, 236, 236),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Image.asset('assets/images/fiction books/The Great Gatsby.jpg',
                  height: 50), // Replace with an appropriate icon
              const SizedBox(width: 15),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Great Gatsby',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'A tragic story of Jay Gatsby and his unrequited love for Daisy Buchanan in the Roaring Twenties.',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScanningHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Fiction Books',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: (){
                
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Myviewmore_fiction(user: user,))); ///view more page//
              },
              child: const Text(
                'View More',
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ListView(
          
          shrinkWrap: true, // Prevents overflow in non-scrolling parent
          physics:
              const NeverScrollableScrollPhysics(), // ListView inside Column shouldn't scroll independently
          children: [
            _buildScanHistoryItem(
                '00000',
                'timeAgo',
                true,
                'assets/images/fiction books/The Whispering Shadows.jpg',
                'The Whispering Shadows',
                'Rs.599',
                context),
            _buildScanHistoryItem(
                '00001',
                'timeAgo',
                true,
                'assets/images/fiction books/Beneath the Crimson Sky.jpg',
                'Beneath the Crimson Sky',
                'Rs.599',
                context),
            _buildScanHistoryItem(
                '00001',
                'timeAgo',
                true,
                'assets/images/fiction books/The Reappearance of Rachel Price.jpg',
                'The Reappearance of Rachel Price',
                'Rs.599',
                context),
            _buildScanHistoryItem(
                '00003',
                'timeAgo',
                true,
                'assets/images/fiction books/The Whispering Shadows.jpg',
                'The Whispering Shadows',
                'Rs.599',
                context),
   
          ],
        ),
      ],
    );
  }

  Widget _buildScanHistoryItem(String serialNo, String timeAgo, bool isValid,
      String imagePath, String name, String price, BuildContext context) {
    return Card(
    color: const Color.fromARGB(255, 248, 246, 246),

      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Image.asset(imagePath, height: 50), // Pharmacy logo
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
              child: Icon(
                isValid ? Icons.shopping_cart_outlined : Icons.warning,
                color: isValid ? Colors.green : Colors.orange,
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
}
