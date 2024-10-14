import 'package:bookstore/cart_provider.dart';
import 'package:bookstore/cartlist.dart';
import 'package:bookstore/product_model.dart';
import 'package:flutter/material.dart';


// Product Overview Page (you'll need to implement this)
class My_productoverview extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const My_productoverview({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final product = Product(imagePath: imagePath, name: name, price: price);

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 400,
              height: 350,
            ),
            Text(name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(price, style: const TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: MaterialButton(
                height: 40,
                minWidth: double.infinity,
                onPressed: () async {
                  await CartProvider.addToCart(product);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Mycartlist()),
                  );
                },
                textColor: Colors.white,
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("Add to cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
