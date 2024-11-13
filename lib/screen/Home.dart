import 'package:brico_voisin/model/product.dart';
import 'package:brico_voisin/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

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

  void _onVoirPlusTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Prochaine fonctionnalité : Vous pourrez bientôt explorer tous les produits !',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.orangeAccent,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductProvider>().products;

    return Scaffold(
      backgroundColor: const Color(0xFFFFECDA),
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
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/images/Bricovoisins.svg',
                    width: 100,
                    height: 18,
                    color: Colors.black,
                  ),
                ],
              ),
              leading: Container(),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 46),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Aux alentours',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'AkiraExpanded',
                    ),
                  ),
                  GestureDetector(
                    onTap: _onVoirPlusTap,
                    child: const Text(
                      'Tout voir',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontFamily: 'Sora',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length > 7 ? 8 : products.length,
                itemBuilder: (context, index) {
                  if (index == 7) {
                    // Case "Voir plus"
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: _onVoirPlusTap,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xFFFFDDBD),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(1),
                                    blurRadius: 0,
                                    offset: const Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'Voir plus',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontFamily: 'Sora',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // Affichage des produits normaux
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 42),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xFFFFDDBD),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(1),
                                blurRadius: 0,
                                offset: const Offset(4, 4),
                              ),
                            ],
                          ),
                          child: CarouselSlider(
                            items: product.imageProduct.map((image) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Image.network(
                                    image,
                                    fit: BoxFit.contain,
                                    width: double.infinity,
                                  ),
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 200,
                              viewportFraction: 1,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.nameProduct.length > 15
                                    ? '${product.nameProduct.substring(0, 15)}...'
                                    : product.nameProduct,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Sora',
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                DateFormat('dd/MM/yyyy à HH\'h\'')
                                    .format(product.updatedAt.toLocal()),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Sora',
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
