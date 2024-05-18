import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'add_product_screen.dart';
import 'product_detail_screen.dart';

class ColumnScreen extends StatefulWidget {
  final List<String> products;
  final Function(String) addProduct;
  final Function(int) removeProduct;

  ColumnScreen({required this.products, required this.addProduct, required this.removeProduct});

  @override
  _ColumnScreenState createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              child: CachedNetworkImage(
                imageUrl: 'https://c1.wallpaperflare.com/preview/997/209/75/retail-grocery-supermarket-store.jpg',
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            ...widget.products.map((product) {
              return GestureDetector(
                onTap: () {
                  _navigateToProductDetailScreen(context, product);
                },
                child: ListTile(
                  title: Text(product),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await _removeProduct(widget.products.indexOf(product));
                      setState(() {});
                    },
                  ),
                ),
              );
            }).toList(),
          ],
        ),
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
