import 'package:brico_voisin/model/product.dart';
import 'package:brico_voisin/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:brico_voisin/theme/theme_style.dart';
import 'package:brico_voisin/theme/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ProductProvider>().fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeStyles.appBarBackgroundColor,
        title: Text(
          'Products',
          style: AppThemeStyles.appBarTextStyle,
        ),
        leading: Transform.translate(
          offset: const Offset(20, 0),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/images/arrow-left.svg',
              width: 32,
              height: 32,
              color: AppThemeStyles.appBarIconColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        decoration: AppThemeStyles.commonBackgroundDecoration,
        child: Consumer<ProductProvider>(
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
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: product.imageProduct.isNotEmpty
                        ? Image.network(product.imageProduct[0])
                        : const Icon(Icons.image_not_supported),
                    title: Text(
                      product.nameProduct,
                      style: AppThemeStyles.generalTextStyle,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.brandProduct,
                            style: AppThemeStyles.generalTextStyle),
                        Text(product.description,
                            style: AppThemeStyles.generalTextStyle),
                        Text(
                          'Prix: \$${product.price.toStringAsFixed(2)}',
                          style: AppThemeStyles.generalTextStyle,
                        ),
                        Text(
                          'Créé le: ${product.createdAt.toString()}',
                          style: AppThemeStyles.generalTextStyle,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
