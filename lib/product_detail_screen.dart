import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;

  ProductDetailScreen({required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: 'https://t3.ftcdn.net/jpg/03/35/61/78/360_F_335617818_D6XfmNhtCyDRTOvK9GXFkNYs3nyLKvfO.jpg',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(height: 20),
            Text(
              'Product Name:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              productName,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Expiry Date:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '2024-12-31', // Ваша дата срока годности
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Price:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '\$10.00', // Ваша цена продукта
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
