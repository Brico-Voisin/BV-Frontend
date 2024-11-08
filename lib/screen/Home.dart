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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: Stack(
          children: [
            // Background SVG
            Container(
              color: Color(0xFFFFECDA), // Couleur de fond
              child: SvgPicture.asset(
                'assets/images/top.svg',
                fit: BoxFit.cover,
                color: Color(0xFFFFDDBD), // Couleur de l'image SVG
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
                  SizedBox(width: 8),
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
            return Column(
              children: [
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 8),
                      viewportFraction: 0.8, // Ajuster la fraction de la vue
                      aspectRatio: 1,
                      enableInfiniteScroll:
                          false, // Désactive la boucle infinie
                      initialPage: 0, // Commencer à partir du premier élément
                    ),
                    items: productProvider.products.map((product) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Card(
                            margin: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: product.imageProduct.isNotEmpty
                                          ? NetworkImage(
                                              product.imageProduct[0])
                                          : const AssetImage(
                                              'assets/images/placeholder.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: -10,
                                  child: Text(
                                    product.nameProduct,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Roboto',
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: -30,
                                  child: Text(
                                    '${product.updatedAt.toLocal()}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
