import 'package:brico_voisin/model/product.dart';
import 'package:brico_voisin/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyListingProductContent extends StatefulWidget {
  const MyListingProductContent({super.key});

  @override
  _MyListingProductContentState createState() =>
      _MyListingProductContentState();
}

class _MyListingProductContentState extends State<MyListingProductContent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ProductProvider>().fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (productProvider.error.isNotEmpty) {
            return Center(child: Text('Error: ${productProvider.error}'));
          }
          return ListView.builder(
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) {
              final product = productProvider.products[index];
              return Card(
                child: ListTile(
                  leading: product.imageProduct.isNotEmpty
                      ? Image.network(product.imageProduct[0])
                      : const Icon(Icons.image_not_supported),
                  title: Text(product.nameProduct),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.brandProduct),
                      Text(product.description),
                      Text('Prix: \$${product.price.toStringAsFixed(2)}'),
                      Text('Créé le: ${product.createdAt.toString()}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
