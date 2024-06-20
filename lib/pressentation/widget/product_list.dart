import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: Image.network(product.image),
          title: Text(product.name),
          subtitle: Text(product.company),
        );
      },
    );
  }
}
