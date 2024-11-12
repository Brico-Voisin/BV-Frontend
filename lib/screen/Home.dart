import 'dart:math';
import 'package:brico_voisin/model/product.dart';
import 'package:brico_voisin/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:brico_voisin/theme/theme_style.dart';
import 'package:brico_voisin/theme/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    final products = context.watch<ProductProvider>().products;

    return Scaffold(
      backgroundColor: const Color(0xFFFFECDA), // Background couleur demandée
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: Stack(
          children: [
            // Background SVG
            Container(
              color: const Color(0xFFFFECDA),
              child: SvgPicture.asset(
                'assets/images/top.svg',
                fit: BoxFit.cover,
                color: const Color(0xFFFFDDBD),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icon.svg',
                    width: 20,
                    height: 20,
                    color: AppThemeStyles.appBarIconColor,
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/images/Bricovoisins.svg',
                    width: 100,
                    height: 18,
                    color: AppThemeStyles.appBarIconColor,
                  ),
                ],
              ),
              leading: Container(),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 21), // Décale le texte "Aux alentours"
              child: const Text(
                'Aux alentours',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'AkiraExpanded', // Applique la police Akira
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Scroll horizontal
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200, // Largeur fixe pour chaque produit
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFFFFDDBD), // Fond du produit
                            border: Border.all(
                              color: Colors.black, // Bordure noire
                              width: 2, // Épaisseur de la bordure
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(1),
                                blurRadius: 0,
                                offset:
                                    Offset(4, 4), // Décalage de l'ombre (X, Y)
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.only(
                              left: 16), // Décale le carrousel à droite
                          child: CarouselSlider(
                            items: product.imageProduct.map((image) {
                              return ClipRRect(
                                child: Image.network(
                                  image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 120,
                              viewportFraction: 1,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18), // Décale le texte du produit à droite
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.nameProduct,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${product.updatedAt.toLocal()}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
