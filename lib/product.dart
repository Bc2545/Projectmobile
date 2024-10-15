import 'package:flutter/material.dart';
import 'confirmPurchasePage.dart'; // Make sure this is included

class Product {
  final String name;
  final String price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});

  Widget buildProductCard(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl, fit: BoxFit.cover, height: 120),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Text(price, style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // Navigate to ConfirmPurchasePage with product details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmPurchasePage(
                    productName: name,
                    productPrice: price,
                  ),
                ),
              );
            },
            child: Text('Buy'),
          ),
        ],
      ),
    );
  }
}
