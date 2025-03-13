import 'package:brico_voisin/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = false;
  String _error = '';
  String _searchQuery = ''; // Nouveau champ pour la recherche

  List<Product> get products =>
      _filteredProducts.isEmpty ? _products : _filteredProducts;
  bool get isLoading => _isLoading;
  String get error => _error;

  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> fetchProducts() async {
    _setLoading(true);
    _resetError();

    try {
      final response = await _supabaseClient.from('products').select();

      _products = response.map((item) => Product.fromJson(item)).toList();
      _applyFilters(); // Appliquer les filtres après avoir chargé les produits
        } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<Product?> fetchProductById(String productId) async {
    try {
      final response = await _supabaseClient
          .from('products')
          .select('''
          *,
          users:userId (
            firstname_user,
            lastname_user
          )
        ''')
          .eq('id_product', productId)
          .single();
      
      return Product.fromJson(response);
          return null;
    } catch (e) {
      _error = e.toString();
      return null;
    }
  }

  // Filtrer les produits par thème
  void setFilterByTheme(String theme) {
    _searchQuery =
        ''; // Réinitialise la recherche lors de la sélection d'un thème
    _filteredProducts = _products.where((product) {
      return product.theme.contains(theme);
    }).toList();
    notifyListeners();
  }

  // Filtrer les produits par recherche
  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  // Applique les filtres en fonction du thème et de la recherche
  void _applyFilters() {
    if (_searchQuery.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products.where((product) {
        return product.nameProduct
            .toLowerCase()
            .contains(_searchQuery.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  // Méthodes auxiliaires pour gérer l'état
  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void _resetError() {
    _error = '';
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }


  
}
