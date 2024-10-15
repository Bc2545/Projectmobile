import 'package:flutter/material.dart';
import 'product.dart'; // Import the Product class
import 'login.dart';

class ProductViewPage extends StatefulWidget {
  final VoidCallback logoutCallback;

  ProductViewPage({required this.logoutCallback});

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  final List<Product> products = [
    Product(
      name: 'iPhone 14',
      price: '\$999',
      imageUrl: 'https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/iphone-14-finish-unselect-gallery-2-202209_FMT_WHH?wid=1280&hei=492&fmt=p-jpg&qlt=80&.v=bjlYUjk1NXN2Uy9CTWFMaXBneUF0dFgrSXpWVEhWaW9YTGlWRHFoSHU0OUM1QUJLM2tvYnRqZUVSdTd3U2FYN0pxbExkakZwOW1FVDBpNHlyYVFtRmdLV2FqbzNtY1BxSW9iSE1sc2hZc1VTcFBPa3B0QmJGZHREamxDVFQvcm5PYmpSM2wxOXR2djFhV2JGeTl0WWFR&traceId=1',
    ),
    Product(
      name: 'Samsung Galaxy S21',
      price: '\$799',
      imageUrl: 'https://images.samsung.com/sg/smartphones/galaxy-s21/buy/s21_ultra_basicgroup_kv_mo_img.jpg',
    ),
    Product(
      name: 'Google Pixel 6',
      price: '\$599',
      imageUrl: 'https://i5.walmartimages.com/seo/Restored-Google-Pixel-6-Pro-128GB-Factory-Unlocked-Stormy-Black-6-7in-Smartphone-Excellent-Refurbished_3f6083b9-42a6-4a27-ab0b-299c86908b39.d20879fab02b926f13f32fc69ab40b5c.jpeg',
    ),
    // Add more products as needed
  ];

  List<Product> filteredProducts = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Initially, display all products
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = products
          .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(loginCallback: () {})),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              widget.logoutCallback(); // Call the logout callback
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage(loginCallback: () {})),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: updateSearchQuery,
              decoration: InputDecoration(
                labelText: 'Search Products',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(2.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return filteredProducts[index].buildProductCard(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
