import 'package:code_competence2/project/constant/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.deepPurple,
        actions: const [
          ShoppingCartIcon(),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, HOME_SCREEN);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Our Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ProductList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingCartIcon extends StatefulWidget {
  const ShoppingCartIcon({Key? key}) : super(key: key);

  @override
  State<ShoppingCartIcon> createState() => _ShoppingCartIconState();
}

class _ShoppingCartIconState extends State<ShoppingCartIcon> {
  int itemCount = 0; // Jumlah item di keranjang

  // Metode ini akan dipanggil untuk memperbarui jumlah item di keranjang
  void updateItemCount(int count) {
    setState(() {
      itemCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            // Tambahkan logika untuk menanggapi klik keranjang di sini
          },
        ),
        if (itemCount > 0)
          Positioned(
            right: 8,
            top: 8,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 10,
              child: Text(
                itemCount.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> productNames = [
    'French Fries',
    'Fudgy Brownies',
    'Cookies',
    'Cupcake',
    'Croissant',
    'Cheesecake',
  ];

  List<bool> likedProducts = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productNames.length,
      itemBuilder: (context, index) {
        return ProductCard(
            productName: productNames[index],
            isLiked: likedProducts[index],
            onLikePressed: () {
              setState(() {
                likedProducts[index] = !likedProducts[index];
              });
            },
            onAddToCartPressed: () {
              _ShoppingCartIconState? cartIconState =
                  context.findAncestorStateOfType<_ShoppingCartIconState>();
              if (cartIconState != null) {
                cartIconState.updateItemCount(cartIconState.itemCount + 1);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Product added to cart!')),
                );
              } else {
                if (kDebugMode) {
                  print("Error: _ShoppingCartIconState not found");
                }
              }
            });
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final bool isLiked;
  final VoidCallback onLikePressed;
  final VoidCallback onAddToCartPressed;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.isLiked,
    required this.onLikePressed,
    required this.onAddToCartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  'assets/$productName.png',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: onLikePressed,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              productName,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onAddToCartPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Icon(Icons.shopping_cart),
                ),
                const Text(
                  '\$10.99',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
