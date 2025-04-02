import 'package:brico_voisin/provider/product_provider.dart';
import 'package:brico_voisin/screen/locationSlides/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LocationSlides extends StatefulWidget {
  const LocationSlides({super.key});

  @override
  State<LocationSlides> createState() => _LocationSlidesState();
}

class _LocationSlidesState extends State<LocationSlides> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  // Données du produit
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCategory;
  List<String> _selectedImages = [];
  final _priceController = TextEditingController();
  
  final List<String> _categories = [
    'Bricolage',
    'Jardinage',
    'Transport',
    'Peinture',
    'Gros Oeuvre',
    'Menuiserie',
  ];

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _submitProduct(BuildContext context) async {
    try {
      final provider = context.read<ProductProvider>();
      await provider.createProduct(
        name: _nameController.text,
        category: _selectedCategory!,
        description: _descriptionController.text,
        images: _selectedImages,
        price: double.parse(_priceController.text),
      );

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Produit ajouté avec succès')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFECDA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (_currentPage == 0) {
              Navigator.pop(context);
            } else {
              _previousPage();
            }
          },
        ),
        title: const Text(
          'LOCATION',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          FirstSlide(
            nameController: _nameController,
            descriptionController: _descriptionController,
            categories: _categories,
            selectedCategory: _selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                _selectedCategory = category;
              });
            },
            onNext: _nextPage,
          ),
          ImageSlide(
            selectedImages: _selectedImages,
            onImagesUpdated: (images) {
              setState(() {
                _selectedImages = images;
              });
            },
            onNext: _nextPage,
          ),
          FinalSlide(
            priceController: _priceController,
            onSubmit: () => _submitProduct(context),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
