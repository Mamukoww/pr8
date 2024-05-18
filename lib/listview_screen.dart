import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'add_product_screen.dart';
import 'product_detail_screen.dart';

class ListViewScreen extends StatefulWidget {
  final List<String> products;
  final Function(String) addProduct;
  final Function(int) removeProduct;

  ListViewScreen({required this.products, required this.addProduct, required this.removeProduct});

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Screen'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            child: CachedNetworkImage(
              imageUrl: 'https://c0.wallpaperflare.com/preview/790/1/146/shelf-shop-grocery-store-market.jpg',
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToProductDetailScreen(context, widget.products[index]);
                  },
                  child: ListTile(
                    title: Text(widget.products[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await _removeProduct(index);
                        setState(() {});
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddProductScreen(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _removeProduct(int index) async {
    widget.removeProduct(index);
  }

  void _navigateToAddProductScreen(BuildContext context) async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductScreen()),
    );
    if (newProduct != null) {
      widget.addProduct(newProduct);
    }
  }

  void _navigateToProductDetailScreen(BuildContext context, String productName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductDetailScreen(productName: productName)),
    );
  }
}
